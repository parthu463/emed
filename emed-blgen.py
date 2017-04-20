#!/usr/bin/env python

import MySQLdb as mdb
import sys
import json

import pprint
import uuid

from openpyxl import Workbook
import time
from datetime import datetime

from emedUtil import createWS, createTitleWS, eventtypes

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
#sys.exit(0)	

for sheet in sheets:
	# pp.pprint(sheet)
	# Get the list of events for each sheet and type in the sheet

	for current_type in range(0, len(eventtypes)):
		eventtype = eventtypes[current_type]
		events_prequery = '';
		if 'eventsApp' == eventtype:
			events_prequery = "select distinct EventGUID from eventsApp\
				INNER JOIN sheetMapping on eventsApp.AppGUID = sheetMapping.DataIdentifier\
				INNER JOIN sheets on sheetMapping.SheetGUID = sheets.SheetGUID\
				where sheetMapping.DataType = %d and sheets.SheetGUID = %s and EventSeverity != 0"

		elif 'eventsTrap' == eventtype:
			events_prequery = "select distinct EventGUID from eventsTrap\
				INNER JOIN sheetMapping on eventsTrap.PowerpackGUID = sheetMapping.DataIdentifier\
				INNER JOIN sheets on sheetMapping.SheetGUID = sheets.SheetGUID\
				where sheetMapping.DataType = %d and sheets.SheetGUID = %s and EventSeverity != 0"

		elif 'eventsTrapVarbind' == eventtype:
			events_prequery = "select dataIdentifier as EventGUID from sheetMapping\
				where sheetMapping.DataType = %d and sheetMapping.SheetGUID = %s"

		else:
			print "Unidentified Event Type: %s" % (eventtype)
			sys.exit(1)

		try:
			events_cur = dbh.cursor(mdb.cursors.DictCursor)
			events_query =  events_prequery % ( current_type, sheet['SheetGUID'] )
	
			events_cur.execute(events_query)
		except mdb.Error, e:
			print "Error %d: %s" % (e.args[0], e.args[1])
			sys.exit(1)

		try:
			events = events_cur.fetchall()
		except mdb.Error, e:
			print "Error %d: %s" % (e.args[0], e.args[1])
			sys.exit(1)

		if events:
			sheet[eventtype] = {}
			for event in events:
				#print "    %s" % ( event['EventGUID'])
				sheet[eventtype][event['EventGUID']] = {}
		
		events_cur.close()
					
# sheets contains the ordered list of sheets to create and the list of events for each sheet.
# uncomment pretty print, sys.exit lines below and run to see format
# pp.pprint(sheets)
# sys.exit(0)

# Data structures populated

# Get the data out of the control table
try:
	control_cur = dbh.cursor(mdb.cursors.DictCursor)
	control_query = "SELECT wbname, wbversion from control where wbtype like 'baseline'"
	control_cur.execute(control_query)
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)

try:
	control = control_cur.fetchone()
except mdb.Error, e:
	print "Error %d: %s" % (e.args[0], e.args[1])
	sys.exit(1)
	
# Create time strings for embedding and in file name
wbTime = datetime.utcnow()
wbRevisionTime = wbTime.strftime("%Y-%b-%d %H:%M:%S") # Embedded in Workbook
wbDaySeconds = (int(wbTime.strftime("%H"),10)*3600)\
+ int(wbTime.strftime("%M"),10)*60\
+ int(wbTime.strftime("%S"),10)
wbFileNameTime = "%s-%05d" % ((wbTime.strftime("%Y%m%d")), wbDaySeconds)

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
