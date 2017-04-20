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
from emedUtil import emed_getEventsTrapVarbindTableName
from emedUtil import emed_getEventDetails

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
		events_prequery = "";
		sheet[eventtype] = {}
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
			tablename = emed_getEventsTrapVarbindTableName(dbh, sheet['SheetGUID'], current_type)
			try:
				tablename['dataIdentifier']
				sheet[eventtype]['source'] = {}
				sheet[eventtype]['source']['tablename'] = tablename['dataIdentifier']
				events_query = "select distinct trapCode as EventGUID from %s" % (sheet[eventtype]['source']['tablename'])
			except TypeError:
				sheet[eventtype]['execute'] = False

		else:
			print "Unidentified Event Type: %s" % (eventtype)
			sys.exit(1)
			
		try:
			sheet[eventtype].pop('execute')
		except KeyError:
			try:
				events_cur = dbh.cursor(mdb.cursors.DictCursor)
				if events_prequery:
					events_query = events_prequery % ( current_type, sheet['SheetGUID'] )
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
			sheet[eventtype]['data'] = {}
			for event in events:
				#print "    %s" % ( event['EventGUID'])
				#sheet[eventtype]['data'][event['EventGUID']] = {}
				emed_getEventDetails(dbh, eventtype, event['EventGUID'], sheet[eventtype])
		else:
			sheet.pop(eventtype)

		events = None
		events_cur.close()
		
					
# sheets contains the ordered list of sheets to create and the list of events for each sheet.
# uncomment pretty print, sys.exit lines below and run to see format
#pp.pprint(sheets)
#sys.exit(0)

# Data structures populated
# Create time strings for embedding and in file name
wbTime = datetime.utcnow()
wbRevisionTime = wbTime.strftime("%Y-%b-%d %H:%M:%S") # Embedded in Workbook
wbDaySeconds = (int(wbTime.strftime("%H"),10)*3600)\
+ int(wbTime.strftime("%M"),10)*60\
+ int(wbTime.strftime("%S"),10)
wbFileNameTime = "%s-%05d" % ((wbTime.strftime("%Y%m%d")), wbDaySeconds)


# Get the data out of the control table for types 'baseline' and 'procedure'
doctypes = ('baseline', 'procedure')
for doctype in doctypes:
	try:
		control_cur = dbh.cursor(mdb.cursors.DictCursor)
		control_query = "SELECT wbname, wbversion from control where wbtype like '%s'" % (doctype)
		control_cur.execute(control_query)
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
	
	try:
		control = control_cur.fetchone()
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
	
	control_cur.close()
	if doctype == 'baseline':
		bl_control = control
	elif doctype == 'procedure':
		sop_control = control
	else:
		print "Unidentified Document Type: %s" % (doctype)
		sys.exit(1)
	

# Create the workbook and get a handle
blfname = "%s_%s_%s.xlsx" % (bl_control['wbname'], bl_control['wbversion'], wbFileNameTime)
sopfname = "%s_%s_%s.xlsx" % (sop_control['wbname'], sop_control['wbversion'], wbFileNameTime)
#print ("blfname : %s" % (blfname))
#print ("sopfname : %s" % (sopfname))

wb = Workbook()

createTitleWS(wb, wbRevisionTime, str(uuid.uuid4()))
for sheet in sheets:
	createWS(wb, sheet, dbh)
	
#wb.save(blfname)

if dbh:
	dbh.close()
	
sys.exit(0)
