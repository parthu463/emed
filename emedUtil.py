#!/usr/bin/env python

import MySQLdb as mdb
import sys
import traceback

from openpyxl import Workbook
from openpyxl.styles import PatternFill, Border, Side, Alignment, Protection, Font, NamedStyle
from openpyxl import load_workbook

import pprint

eventtypes = ('eventsApp', 'eventsTrap', 'eventsTrapVarbind', 'eventsInternal')

pp = pprint.PrettyPrinter(indent = 1, depth = 6)

def createDocSet(doctypes, docMetaData, sheets):
	for doctype in doctypes:
		metaData = docMetaData[doctype]
		wb = Workbook()
	
		createTitleWS(wb, docMetaData, metaData)
		for sheet in sheets:
			if doctype == 'baseline':
				createBaselineWS(wb, sheet, paletteName=metaData['docControl']['docPalette'], formatWB=metaData['isFormatted'])
			elif doctype == 'procedure':
				createProcedureWS(wb, sheet, paletteName=metaData['docControl']['docPalette'], formatWB=metaData['isFormatted'])
	
		wb.save(metaData['fname'])
		print('Created file: %s' % (metaData['fname']))

def createTitleWS(wb, docMetaData, metaData):

	ws = wb.active
	ws.title = "Title"  # This is the tab name in the workbook

	palette = createPalette(metaData['docControl']['docPalette'])
	
	# Create the title worksheet title row
	columnList = ('A', )
	labelList = ('Virtustream', )
	createWSTitleRow(ws, palette, columnList, labelList, format=metaData['isFormatted'], merge=('A', 'B'))
	
	# Create the title worksheet header row
	columnList = ('A', )
	labelList = (metaData['docControl']['docDescTitle'], )
	createWSHeaderRow(ws, palette, columnList, labelList, format=metaData['isFormatted'], merge=('A', 'B'))

	# Create the title worksheet data rows
	titleSheetRows = (
	('Generator', docMetaData['generator'], ),
	('Creation Time', docMetaData['revisionTime'], ),
	('Identifier', docMetaData['uuid'], ),
	)

	rownumber = palette['titledatarow']
	for titleSheetRow in titleSheetRows:
		columnList = ('A', 'B')
		dataList = (titleSheetRow[0], titleSheetRow[1], )
		rownumber = createWSRow(ws, palette, columnList, dataList, 'titledata',\
			rownumber = rownumber, format=metaData['isFormatted'])

	ws.column_dimensions['A'].width = 16
	ws.column_dimensions['B'].width = 50
	
def createBaselineWS(wb, s, paletteName = 'soft', formatWB=True):
	pp = pprint.PrettyPrinter(indent = 1)
	# pp.pprint(s)

	palette = createPalette(paletteName)
	
	severityMapping = ["Healthy" \
	,'Informational' \
	,'Minor' \
	,'Major' \
	,'Critical']
	
	ws = wb.create_sheet(s['SheetName'])

	# Create the monitored object worksheet title row
	columnList = ('A', 'B', 'F', )
	labelList = ('Virtustream', s['SheetDesc'], '', )
	createWSTitleRow(ws, palette, columnList, labelList, format=formatWB, merge = ('B','F'))
	
	# Create the monitored object worksheet header row
	columnList = ('A', 'B', 'C', 'D', 'E', 'F', )
	labelList = ('Event Name', 'Message Format', 'Threshold', 'Unit', 'Severity', 'Inc. Priority', )
	createWSHeaderRow(ws, palette, columnList, labelList, format=formatWB)
	
	# Create the monitored object worksheet data rows

	rownumber = palette['datarow']
	columnList = ('A', 'B', 'C', 'D', 'E', 'F', )

	# Get the list of events for each sheet and type in the sheet
	for eventtype in eventtypes:
		try:
			localEventTree = s[eventtype]['data']
			#pp.pprint(localEventTree)

		except KeyError, e:
			# Not all sheets will have all event types so continue
			continue

		try:
			for eventID in s[eventtype]['data']:
				if isinstance(s[eventtype]['data'][eventID]['EventSeverity'], int):
					loopSeverity = severityMapping[s[eventtype]['data'][eventID]['EventSeverity']]
				else:
					loopSeverity = s[eventtype]['data'][eventID]['EventSeverity']
				
				incidentPriority = s[eventtype]['data'][eventID]['incidentPriority']
				
				dataList = (s[eventtype]['data'][eventID]['EventName'],
				s[eventtype]['data'][eventID]['AlertMessage'],
				str(s[eventtype]['data'][eventID]['ThresholdValue']),
				s[eventtype]['data'][eventID]['ThresholdUnit'],
				loopSeverity,
				incidentPriority, 
				)
				
				#pp.pprint(dataList)
				rownumber = createWSRow(ws, palette, columnList, dataList, 'data',\
					rownumber = rownumber, format=formatWB)
		except KeyError, e:
			# A key error here means we didn't get all the data back from the data structure
			# Print the key and exit
			print "KeyError: Missing field %s" % (str(e))
			traceback.print_stack()
			sys.exit(1)
			
	# Set the appropriate column widths for this sheet
	ws.column_dimensions['A'].width = 55
	ws.column_dimensions['B'].width = 105
	ws.column_dimensions['C'].width = 10
	ws.column_dimensions['D'].width = 10
	ws.column_dimensions['E'].width = 10
	ws.column_dimensions['F'].width = 15

#	filterStart_ID = 'A%d'% (palette['headerrow'])
#	filterEnd_ID = 'F%d' % (row - 1)
#	filterRange = '%s:%s' % (filterStart_ID, filterEnd_ID)
#	ws.auto_filter_ref = filterRange
#	ws.auto_filter.add_filter_column('A')
#	ws.auto_filter.add_filter_column('B')
#	ws.auto_filter.add_filter_column('C')
#	ws.auto_filter.add_filter_column('D')
#	ws.auto_filter.add_filter_column('E')
#	ws.auto_filter.add_filter_column('F')

#	pp.pprint(ws)

def createProcedureWS(wb, s, paletteName = 'soft', formatWB=True):
	pp = pprint.PrettyPrinter(indent = 1)
	# pp.pprint(s)

	palette = createPalette(paletteName)
	
	severityMapping = ["Healthy" \
	,'Informational' \
	,'Minor' \
	,'Major' \
	,'Critical']
	
	ws = wb.create_sheet(s['SheetName'])

	# Create the monitored object worksheet title row
	columnList = ('A', 'B', 'F', )
	labelList = ('Virtustream', s['SheetDesc'], '', )
	createWSTitleRow(ws, palette, columnList, labelList, format=formatWB, merge = ('B','F'))
	
	# Create the monitored object worksheet header row
	columnList = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', )
	labelList = ('Event Name', 'Message Format', 'Threshold', 'Unit', 'Severity', 'Source', 'Inc. Priority', 'Procedure', 'Event GUID')
	createWSHeaderRow(ws, palette, columnList, labelList, format=formatWB)
	
	# Create the monitored object worksheet data rows

	rownumber = palette['datarow']
	columnList = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', )
	
	# Get the list of events for each sheet and type in the sheet
	for eventtype in eventtypes:
		try:
			localEventTree = s[eventtype]['data']
			#pp.pprint(localEventTree)

		except KeyError, e:
			# Not all sheets will have all event types so continue
			continue

		try:
			for eventID in s[eventtype]['data']:
				# Normalize loop severity
				if isinstance(s[eventtype]['data'][eventID]['EventSeverity'], int):
					loopSeverity = severityMapping[s[eventtype]['data'][eventID]['EventSeverity']]
				else:
					loopSeverity = s[eventtype]['data'][eventID]['EventSeverity']

				incidentPriority = s[eventtype]['data'][eventID]['incidentPriority']
				procText = 	s[eventtype]['data'][eventID]['procText']
				
				dataList = (s[eventtype]['data'][eventID]['EventName'],
				s[eventtype]['data'][eventID]['AlertMessage'],
				str(s[eventtype]['data'][eventID]['ThresholdValue']),
				s[eventtype]['data'][eventID]['ThresholdUnit'],
				loopSeverity,
				s[eventtype]['data'][eventID]['AppName'],
				incidentPriority,
				procText, 
				eventID
				)
				
				#pp.pprint(dataList)
				rownumber = createWSRow(ws, palette, columnList, dataList, 'data',\
					rownumber = rownumber, format=formatWB)

		except KeyError, e:
			# A key error here means we didn't get all the data back from the data structure
			# Print the key and exit
			print "KeyError: Missing field %s" % (str(e))
			traceback.print_stack()
			sys.exit(1)

	# Set the appropriate column widths for this sheet
	ws.column_dimensions['A'].width = 55
	ws.column_dimensions['B'].width = 105
	ws.column_dimensions['C'].width = 10
	ws.column_dimensions['D'].width = 10
	ws.column_dimensions['E'].width = 10
	ws.column_dimensions['F'].width = 35
	ws.column_dimensions['G'].width = 15
	ws.column_dimensions['H'].width = 35
	ws.column_dimensions['I'].width = 35

#	filterStart_ID = 'A%d'% (palette['headerrow'])
#	filterEnd_ID = 'F%d' % (row - 1)
#	filterRange = '%s:%s' % (filterStart_ID, filterEnd_ID)
#	ws.auto_filter_ref = filterRange
#	ws.auto_filter.add_filter_column('A')
#	ws.auto_filter.add_filter_column('B')
#	ws.auto_filter.add_filter_column('C')
#	ws.auto_filter.add_filter_column('D')
#	ws.auto_filter.add_filter_column('E')
#	ws.auto_filter.add_filter_column('F')

#	pp.pprint(ws)

def createWSTitleRow(ws, palette, columnList, labelList, merge = None, format=True):
	createWSRow(ws, palette, columnList, labelList, 'title', merge=merge, format=format)

def createWSHeaderRow(ws, palette, columnList, labelList, merge = None, format=True):
	createWSRow(ws, palette, columnList, labelList, 'header', merge=merge, format=format)
	
def createWSRow(ws, palette, columnList, labelList, rowtype, rownumber=None, merge=None, format=True):
	rowname = '%srow' % (rowtype)
	fontsizename = '%sfontsize' % (rowtype)
	fontboldname = '%sfontbold' % (rowtype)
	
	if rowtype != 'data':
		fillcolorname = '%sfillcolor' % (rowtype)
	else:
		fillcolorname = '%sfillcolor%d' % (rowtype, (rownumber % 2))

	bold = palette[fontboldname]
		
	if rownumber:
		rowvalue = str(rownumber)
	else:
		rowvalue = palette[rowname]

	for idx in range(0, len(columnList)):
		currentCellName = '%s%s' % (columnList[idx], rowvalue)
		currentCell = ws[currentCellName]
		currentCell.value = labelList[idx]
		try:
			currentCell.font = Font(bold = bold, size=palette[fontsizename])
		except:
			print('KeyError: %s not found in palette' % (fontsizename))
			
		try:
			if format:
				currentCell.fill = PatternFill('solid', fgColor=palette[fillcolorname])
		except KeyError:
			print('KeyError: %s not found in palette' % (fillcolorname))
			
	#	ws.merge_cells('%s:%s' % (cellB_ID, cellF_ID))
	if merge:
		mergeRange = '%s%d:%s%d' % (merge[0], palette[rowname], merge[1], palette[rowname])
		ws.merge_cells(mergeRange)
		
	if rownumber:
		return int( int(rownumber) + 1)

def createPalette(style):
	palette = {}
	palette['virtustream'] = {}

	palette['virtustream']['titlerow'] = 1
	palette['virtustream']['titlefontsize'] = 14
	palette['virtustream']['titlefontbold'] = True
	palette['virtustream']['titlefillcolor'] = 'bd1e30'
	
	palette['virtustream']['titledatarow'] = 6
	palette['virtustream']['titledatafontsize'] = 11
	palette['virtustream']['titledatafontbold'] = False
	palette['virtustream']['titledatafillcolor'] = 'ffffff'
	
	palette['virtustream']['headerrow'] = 2
	palette['virtustream']['headerfontsize'] = 12
	palette['virtustream']['headerfontbold'] = True
	palette['virtustream']['headerfillcolor'] = '1a4b5f'

	palette['virtustream']['datarow'] = 3
	palette['virtustream']['datafontsize'] = 11
	palette['virtustream']['datafontbold'] = False

	palette['virtustream']['datafillcolor0'] = '586a6f'
	palette['virtustream']['datafillcolor1'] = 'b5b9bb'
	
	palette['soft'] = {}

	palette['soft']['titlerow'] = 1
	palette['soft']['titlefontsize'] = 14
	palette['soft']['titlefontbold'] = True
	palette['soft']['titlefillcolor'] = 'f6273e'

	palette['soft']['titledatarow'] = 6
	palette['soft']['titledatafontsize'] = 11
	palette['soft']['titledatafontbold'] = False
	palette['soft']['titledatafillcolor'] = 'ffffff'

	palette['soft']['headerrow'] = 2
	palette['soft']['headerfontsize'] = 12
	palette['soft']['headerfontbold'] = True
	palette['soft']['headerfillcolor'] = '21627c'

	palette['soft']['datarow'] = 3
	palette['soft']['datafontsize'] = 11
	palette['soft']['datafontbold'] = False

	palette['soft']['datafillcolor0'] = '728a90'
	palette['soft']['datafillcolor1'] = 'd9d9d9'
	
	return palette[style]
	
def emed_getEventsTrapVarbindTableName(dbh, SheetGUID, current_type):
	tablename_prequery = "select dataIdentifier from sheetMapping\
		where sheetMapping.DataType = %d and sheetMapping.SheetGUID = %s"
	try:
		tablename_cur = dbh.cursor(mdb.cursors.DictCursor)
		tablename_query =  tablename_prequery % ( int(current_type), SheetGUID )
		tablename_cur.execute(tablename_query)
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)

	try:
		tablename = tablename_cur.fetchone()
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
	
	tablename_cur.close()
	return tablename
	
def	emed_getEventDetailsFromSQL(dbh, event_query):
	#pp.pprint('emed_getEventDetailsFromSQL')
	try:
		event_cur = dbh.cursor(mdb.cursors.DictCursor)
		#pp.pprint(event_query)
		event_cur.execute(event_query)
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
	
	try:
		event = event_cur.fetchone()
	except mdb.Error, e:
		print "Error %d: %s" % (e.args[0], e.args[1])
		sys.exit(1)
				
	event_cur.close()
	
	#pp.pprint(event)
	return event

	
def	emed_getEventDetails_App(dbh, eventGUID, eventRoot):
	#pp.pprint('emed_getEventDetails_App')
	#event_prequery = "SELECT EventName, AlertMessage, ThresholdValue, ThresholdUnit, EventSeverity, AppName \
	#from eventsApp where EventGUID = '%s'"
	event_prequery = "SELECT EventName, AlertMessage, ThresholdValue, ThresholdUnit, EventSeverity, AppName \
		, incidentPriority, procText.procText \
		from eventsApp \
		LEFT OUTER JOIN eventProcMapping on eventsApp.EventGUID = eventProcMapping.EventGUID \
		LEFT OUTER JOIN procText on procText.procTextID = eventProcMapping.procTextID \
		where eventsApp.EventGUID = '%s'"
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails_Trap(dbh, eventGUID, eventRoot):
	#pp.pprint('emed_getEventDetails_Trap')
	#event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity \
	#from eventsTrap where EventGUID = '%s'"
	event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity, incidentPriority, procText.procText \
	from eventsTrap \
	LEFT OUTER JOIN eventProcMapping on eventsTrap.EventGUID = eventProcMapping.EventGUID \
	LEFT OUTER JOIN procText on procText.procTextID = eventProcMapping.procTextID \
	where eventsTrap.EventGUID = '%s'"
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails_TrapVarbind(dbh, eventGUID, eventRoot, tablename):
	#pp.pprint('emed_getEventDetails_TrapVarbind')
	#pp.pprint(tablename)
	#event_prequery = "SELECT trapName as EventName, trapMessage as AlertMessage,\
	#	trapSeverity as EventSeverity from %s where trapCode = '%%s'" % (tablename)
	event_prequery = "SELECT trapName as EventName, trapMessage as AlertMessage, trapSeverity as EventSeverity \
	, incidentPriority, procText from %s \
	LEFT OUTER JOIN eventProcMapping on %s.trapCode = eventProcMapping.EventGUID \
	LEFT OUTER JOIN procText on procText.procTextID = eventProcMapping.procTextID \
	where trapCode = '%%s'" % (tablename, tablename)
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails_Internal(dbh, eventGUID, eventRoot):
	#pp.pprint('emed_getEventDetails_Internal')
	#event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity \
	#from eventsTrap where EventGUID = '%s'"
	event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity, incidentPriority, procText.procText \
	from eventsInternal \
	LEFT OUTER JOIN eventProcMapping on eventsInternal.EventGUID = eventProcMapping.EventGUID \
	LEFT OUTER JOIN procText on procText.procTextID = eventProcMapping.procTextID \
	where eventsInternal.EventGUID = '%s'"
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails(dbh, eventtype, eventGUID, eventRoot):
	eventRoot['data'][eventGUID] = {}
	if 'eventsApp' == eventtype:
		eventRoot['data'][eventGUID] = emed_getEventDetails_App(dbh, eventGUID, eventRoot)
	elif 'eventsTrap' == eventtype:
		eventRoot['data'][eventGUID] = emed_getEventDetails_Trap(dbh, eventGUID, eventRoot)
	elif 'eventsTrapVarbind' == eventtype:
		eventRoot['data'][eventGUID] = emed_getEventDetails_TrapVarbind(dbh, eventGUID, eventRoot, eventRoot['source']['tablename'])
	elif 'eventsInternal' == eventtype:
		eventRoot['data'][eventGUID] = emed_getEventDetails_Internal(dbh, eventGUID, eventRoot)
	else:
		print "Unidentified Event Type: %s" % (eventtype)
		sys.exit(1)

	if 'eventsApp' == eventtype:
		eventRoot['data'][eventGUID]['AppName'] = "%s (DynApp)" % (eventRoot['data'][eventGUID]['AppName'])

	elif 'eventsTrap' == eventtype:
		eventRoot['data'][eventGUID]['ThresholdValue'] = ''
		eventRoot['data'][eventGUID]['ThresholdUnit'] = ''
		eventRoot['data'][eventGUID]['AppName'] = 'SNMP Trap by OID'

	elif 'eventsTrapVarbind' == eventtype:
		eventRoot['data'][eventGUID]['ThresholdValue'] = ''
		eventRoot['data'][eventGUID]['ThresholdUnit'] = ''
		eventRoot['data'][eventGUID]['AppName'] = 'SNMP Trap by Varbind'

	elif 'eventsInternal' == eventtype:
		eventRoot['data'][eventGUID]['ThresholdValue'] = ''
		eventRoot['data'][eventGUID]['ThresholdUnit'] = ''
		eventRoot['data'][eventGUID]['AppName'] = 'Internal'
	
	else:
		raise TypeError
	
def emed_getEventsDetails(dbh, eventtype, eventGUID, eventRoot):
	emed_getEventDetails(dbh, eventtype, eventGUID, eventRoot)

