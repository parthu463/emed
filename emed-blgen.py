#!/usr/bin/env python

import MySQLdb as mdb
import sys, os
import json

from datetime import datetime
import time

import pprint
import uuid

from emedUtil import eventtypes
from emedUtil import emed_getEventsTrapVarbindTableName
from emedUtil import emed_getEventDetails
from emedUtil import createDocSet

pp = pprint.PrettyPrinter(indent = 1)

#docMetaData keeps data needed for the current run
docMetaData = {}

# name of the generator program
docMetaData['generator'] = os.path.basename(sys.argv[0])

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

# List of the doctypes being generated
# (doctypes could be generated from emed with active/inactive keys in the 'control' table)
doctypes = ('baseline', 'procedure')
for doctype in doctypes:
	docMetaData[doctype] = {}

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
				events_query = "select distinct trapCode as EventGUID from %s where eventActive = TRUE" % (sheet[eventtype]['source']['tablename'])
			except TypeError:
				sheet[eventtype]['execute'] = False

		elif 'eventsInternal' == eventtype:
			events_prequery = "select distinct EventGUID from eventsInternal\
				INNER JOIN sheetMapping on eventsInternal.EventGUID = sheetMapping.DataIdentifier\
				INNER JOIN sheets on sheetMapping.SheetGUID = sheets.SheetGUID\
				where sheetMapping.DataType = %d and sheets.SheetGUID = %s and EventSeverity != 0"

		else:
			# stupid to put line number in the output. FIX!!!
			print "Unidentified Event Type: %s : Line 120" % (eventtype)
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
# pp.pprint(sheets)
# sys.exit(0)

# Data structures populated


# Create time strings for embedding and in file name
# Store in docMetaData
wbTime = datetime.utcnow()
docMetaData['revisionTime'] = wbTime.strftime("%Y-%b-%d %H:%M:%S (UTC)") # Embedded in Workbook
#pp.pprint(wbRevisionTime)
wbDaySeconds = (int(wbTime.strftime("%H"),10)*3600)\
+ int(wbTime.strftime("%M"),10)*60\
+ int(wbTime.strftime("%S"),10)
docMetaData['fileNameTime'] = "%s-%05d" % ((wbTime.strftime("%Y%m%d")), wbDaySeconds)

#UUID into docMetaData
docMetaData['uuid'] = str(uuid.uuid4())


# Get the data out of the control table for the different doctypes
for doctype in doctypes:
	try:
		control_cur = dbh.cursor(mdb.cursors.DictCursor)
		control_query = "SELECT * from docControl where docType like '%s'" % (doctype)
		#pp.pprint(control_query)
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
	try:
		docMetaData[doctype]['docControl'] = control
		docMetaData[doctype]['isFormatted'] = False
		# True/False can't be stored in SQL, normalize the 'isFormatted' parameter
		if int(docMetaData[doctype]['docControl']['docFormatted']) == 1:
					docMetaData[doctype]['isFormatted'] = True
		docMetaData[doctype]['fname'] = "%s_%s_%s.xlsx" %\
			(control['docBaseName'], control['docVersion'], docMetaData['fileNameTime'])
	except KeyError:
		print "Unidentified Document Type: %s" % (doctype)
		sys.exit(1)
	
# Everything is in memory.  Done with the database.
if dbh:
	dbh.close()

# create the workbooks
createDocSet(doctypes, docMetaData, sheets)

sys.exit(0)
