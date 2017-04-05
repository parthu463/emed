#!/usr/bin/env python

import MySQLdb as mdb
import sys
import json

import pprint
import uuid

from openpyxl import Workbook
import time
from datetime import datetime

from createWS import *

pp = pprint.PrettyPrinter(indent = 1)

# Database connectivity
dbname = 'emed'
crd_fname = "EVTM.crd"

# Get credentials
try:
	dbcreds = json.loads(open(crd_fname).read())
except IOError as e:
	print "Error %d: Database Credentials file %s not found" % (e.args[0], crd_fname)
	sys.exit(1)

# the database must exist in the crd file
try: 
	uname = dbcreds[dbname]['uname']
	pword = dbcreds[dbname]['pword']
	try:
		dbhost = dbcreds[dbname]['dbhost']
	except KeyError, e:
		dbhost = 'localhost'
except KeyError, e:
	print "Database named %s not found in %s. No credentials available." % (e, crd_fname)
	sys.exit(1)

# can we connect?
try:
	dbh = mdb.connect(host = dbhost, user = uname,  passwd = pword, db = dbname)
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)

# Get a curstor into the database
# cur = dbh.cursor(mdb.cursors.DictCursor)

wbTime = datetime.utcnow()
wbRevisionTime = wbTime.strftime("%Y-%b-%d %H:%M:%S") # Embedded in Workbook
wbDaySeconds = "%s" % ((int(wbTime.strftime("%H"),10)*3600)\
+ int(wbTime.strftime("%M"),10)*60\
+ int(wbTime.strftime("%S"),10))
wbFileNameTime = "%s-%s" % ((wbTime.strftime("%Y-%b-%d")), wbDaySeconds)

# Get the list of sheets
try:
	sheets_cur = dbh.cursor(mdb.cursors.DictCursor)
	sheets_query = "SELECT SheetGUID, SheetName, SheetDesc, displayOrder from sheets where active = true order by displayOrder"
	sheets_cur.execute(sheets_query)
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)

try:
	sheets = sheets_cur.fetchall()
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)
	
#pp.pprint(sheets)
#print sheet['displayOrder']
#print "Sheet: %s; SheetGUID: %s" (sheet['SheetName'], sheet['SheetGUID'])
	

for sheet in sheets:
	# Get the list of events for each sheet
	# print "Sheet: %s; SheetGUID: %s" % (sheet['SheetName'], sheet['SheetGUID'])
	try:
		events_cur = dbh.cursor(mdb.cursors.DictCursor)
		events_query = "select distinct EventGUID from eventsApp INNER JOIN sheetappmapping on eventsApp.AppGUID = sheetappmapping.AppGUID  INNER JOIN sheets on sheetappmapping.SheetGUID = sheets.SheetGUID where sheets.SheetGUID = %s and EventSeverity != 0" % ( sheet['SheetGUID'] )

		events_cur.execute(events_query)
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)

	try:
		events = events_cur.fetchall()
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
	sheet['eventsApp'] = {}
	for event in events:
		#print "    %s" % ( event['EventGUID'])
		sheet['eventsApp'][event['EventGUID']] = {}
		
#pp.pprint(sheets)

# sheets contains the ordered list of sheets to create and the list of events for each sheet.
#  ({'SheetGUID': 1L,
#  'SheetName': 'UCS',
#    'displayOrder': 2L,
#    'events': {'2178341D754953C09EAFC442A3823E51': {},
#               '323AA806419C1EA1817DED17FB86A1A3': {},
#               'DED8A1475BFF9428CDBF1713D93B423C': {}}},
#   {'SheetGUID': 2L,
#    'SheetName': 'vSphere Hosts',
#    'displayOrder': 3L,
#    'events': {'1BB1E3BCC297796F60CAD9A056A9C923': {},
#               'C8C344738D2E17B18B0BFBE64FFECF54': {}}},
#   {'SheetGUID': 3L,
#    'SheetName': 'vSphere Datastores',
#    'displayOrder': 4L,
#    'events': {'A29279EE1201EBC8C437DB700D1CC78F': {}}})

# Get the data out of the control table
try:
	control_cur = dbh.cursor(mdb.cursors.DictCursor)
	control_query = "SELECT wbtype, wbformat, wbname, wbversion from control"
	control_cur.execute(control_query)
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)

try:
	control = control_cur.fetchone()
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)
	
# Create the workbook and get a handle
blfname = "%s_%s_%s.xlsx" % (control['wbname'], control['wbversion'], wbFileNameTime)
wb = Workbook()

createTitleWS(wb, wbRevisionTime, str(uuid.uuid4()))
for sheet in sheets:
	createWS(wb, sheet, dbh)
	
wb.save(blfname)

if dbh:
	dbh.close()
	
sys.exit(0)
