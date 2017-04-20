#!/usr/bin/env python

import MySQLdb as mdb
import sys, copy

from openpyxl import Workbook
from openpyxl.styles import PatternFill, Border, Side, Alignment, Protection, Font, NamedStyle
from openpyxl import load_workbook

import pprint

eventtypes = ('eventsApp', 'eventsTrap', 'eventsTrapVarbind')

pp = pprint.PrettyPrinter(indent = 1, depth = 4)

def createTitleWS(wb, revtime, uuidstr, FormatWB=True, generator='emed-blgen.py'):
	ws = wb.active
	ws.title = "Title"
	
	formatPalette = {}
	formatPalette['virtustream'] = {}

	formatPalette['virtustream']['titlefontsize'] = 14
	formatPalette['virtustream']['titlefillcolor'] = 'bd1e30'

	formatPalette['virtustream']['labelfontsize'] = 12
	formatPalette['virtustream']['labelfillcolor'] = '1a4b5f'
	
	formatPalette['soft'] = {}

	formatPalette['soft']['titlefontsize'] = 14
	formatPalette['soft']['titlefillcolor'] = 'f6273e'

	formatPalette['soft']['labelfontsize'] = 12
	formatPalette['soft']['labelfillcolor'] = '21627c'

	palette = 'virtustream'
	palette = 'soft'
	
	c=ws['A1']
	c.value = 'Virtustream'
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['titlefontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['titlefillcolor'])
	ws.merge_cells('A1:B1')
	
	c=ws['A2']
	c.value = 'Monitored Objects and Thresholds for Vblock Systems'
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['labelfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['labelfillcolor'])
	ws.merge_cells('A2:B2')
	
	c=ws['A6']
	c.value = 'Generator'
	if FormatWB:
		c.font = Font(size=formatPalette[palette]['labelfontsize'])
	c=ws['B6']
	c.value = generator
	c=ws['A7']
	c.value = 'Creation Time'
	if FormatWB:
		c.font = Font(size=formatPalette[palette]['labelfontsize'])
	c=ws['B7'] = revtime
	c=ws['A8']
	c.value = 'Identifier'
	if FormatWB:
		c.font = Font(size=formatPalette[palette]['labelfontsize'])
	c=ws['B8']
	c.value = uuidstr
	
	ws.column_dimensions['A'].width = 16
	ws.column_dimensions['B'].width = 50
	
def createWS(wb, s, FormatWB=True):
	pp = pprint.PrettyPrinter(indent = 1)
	# pp.pprint(s)

	# Create styles and positions in worksheets
	formatPalette = {}
	formatPalette['virtustream'] = {}

	formatPalette['virtustream']['titlerow'] = 1
	formatPalette['virtustream']['titlefontsize'] = 14
	formatPalette['virtustream']['titlefillcolor'] = 'bd1e30'


	formatPalette['virtustream']['headerrow'] = 2
	formatPalette['virtustream']['headerfontsize'] = 12
	formatPalette['virtustream']['headerfillcolor'] = '1a4b5f'

	formatPalette['virtustream']['firstdatarow'] = 3

	formatPalette['virtustream']['data0fillcolor'] = '586a6f'
	formatPalette['virtustream']['data1fillcolor'] = 'b5b9bb'
	
	formatPalette['soft'] = {}

	formatPalette['soft']['titlerow'] = 1
	formatPalette['soft']['titlefontsize'] = 14
	formatPalette['soft']['titlefillcolor'] = 'f6273e'


	formatPalette['soft']['headerrow'] = 2
	formatPalette['soft']['headerfontsize'] = 12
	formatPalette['soft']['headerfillcolor'] = '21627c'

	formatPalette['soft']['firstdatarow'] = 3

	formatPalette['soft']['data0fillcolor'] = '728a90'
	formatPalette['soft']['data1fillcolor'] = 'd9d9d9'

	palette = 'virtustream'
	palette = 'soft'
	
	# create styles
	#style_header = NamedStyle(name='VS_Header')
	#style_data1 = NamedStyle(name='VS_Data0')
	#style_data2 = NamedStyle(name='VS_Data1')
		
	
	severityMapping = ["Healthy" \
	,'Informational' \
	,'Warning' \
	,'Minor' \
	,'Major' \
	,'Critical']
	
	ws = wb.create_sheet(s['SheetName'])

	# Title Row
	
	cellA_ID = 'A%d'% (formatPalette[palette]['titlerow'])
	cellB_ID = 'B%d'% (formatPalette[palette]['titlerow'])
	cellF_ID = 'F%d'% (formatPalette[palette]['titlerow'])
	c = ws[cellA_ID]
	c.value = 'Virtustream'
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['titlefontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['titlefillcolor'])
#	c.style = vs_title


	c = ws[cellB_ID]
	c.value = s['SheetDesc']
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['titlefontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['titlefillcolor'])
	ws.merge_cells('%s:%s' % (cellB_ID, cellF_ID))
	
	
	# Header Row
	cellA_ID = 'A%d'% (formatPalette[palette]['headerrow'])
	cellB_ID = 'B%d'% (formatPalette[palette]['headerrow'])
	cellC_ID = 'C%d'% (formatPalette[palette]['headerrow'])
	cellD_ID = 'D%d'% (formatPalette[palette]['headerrow'])
	cellE_ID = 'E%d'% (formatPalette[palette]['headerrow'])
	cellF_ID = 'F%d'% (formatPalette[palette]['headerrow'])
	ws[cellA_ID] = 'Event Name'
	c = ws[cellA_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])
	ws[cellB_ID] = 'Message Format'
	c = ws[cellB_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])
	ws[cellC_ID] = 'Threshold'
	c = ws[cellC_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])
	ws[cellD_ID] = 'Unit'
	c = ws[cellD_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])
	ws[cellE_ID] = 'Severity'
	c = ws[cellE_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])
	ws[cellF_ID] = 'Dynamic App'
	c = ws[cellF_ID]
	if FormatWB:
		c.font = Font(bold = True, size=formatPalette[palette]['headerfontsize'])
		c.fill = PatternFill('solid', fgColor=formatPalette[palette]['headerfillcolor'])

	row = formatPalette[palette]['firstdatarow']

	# Get the list of events for each sheet and type in the sheet

	for eventtype in eventtypes:
		try:
			for eventID in s[eventtype]['data']:
				cellA_ID = 'A%d'% (row)
				cellB_ID = 'B%d'% (row)
				cellC_ID = 'C%d'% (row)
				cellD_ID = 'D%d'% (row)
				cellE_ID = 'E%d'% (row)
				cellF_ID = 'F%d'% (row)
		
				if (row % 2) == 1:
					rowfillcolor = formatPalette[palette]['data0fillcolor']
				else:
					rowfillcolor = formatPalette[palette]['data1fillcolor']

				ws[cellA_ID] = s[eventtype]['data'][eventID]['EventName']
				c=ws[cellA_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellB_ID] = s[eventtype]['data'][eventID]['AlertMessage']
				c=ws[cellB_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellC_ID] = s[eventtype]['data'][eventID]['ThresholdValue']
				c=ws[cellC_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellD_ID] = s[eventtype]['data'][eventID]['ThresholdUnit']
				c=ws[cellD_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor) 
				# eventsTrapVarbind severities are already strings
				if isinstance(s[eventtype]['data'][eventID]['EventSeverity'], int):
					ws[cellE_ID] = severityMapping[s[eventtype]['data'][eventID]['EventSeverity']]
				else:
					ws[cellE_ID] = s[eventtype]['data'][eventID]['EventSeverity']
				c=ws[cellE_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellF_ID] = s[eventtype]['data'][eventID]['AppName']
				c=ws[cellF_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
	
				row = row + 1

		except KeyError:
			continue

	ws.column_dimensions['A'].width = 55
	ws.column_dimensions['B'].width = 105
	ws.column_dimensions['C'].width = 10
	ws.column_dimensions['D'].width = 10
	ws.column_dimensions['E'].width = 10
	ws.column_dimensions['F'].width = 35

	filterStart_ID = 'A%d'% (formatPalette[palette]['headerrow'])
	filterEnd_ID = 'F%d' % (row - 1)
	filterRange = '%s:%s' % (filterStart_ID, filterEnd_ID)
	ws.auto_filter_ref = filterRange
#	ws.auto_filter.add_filter_column('A')
#	ws.auto_filter.add_filter_column('B')
#	ws.auto_filter.add_filter_column('C')
#	ws.auto_filter.add_filter_column('D')
#	ws.auto_filter.add_filter_column('E')
#	ws.auto_filter.add_filter_column('F')

#	pp.pprint(ws)



def loadWStoEMED(type, wsdata, dbh):

	# Get a curstor into the database
	cur = dbh.cursor(mdb.cursors.DictCursor)
	
	wb = load_workbook(filename = wsdata[type]['fname'])
	ws = wb[wsdata[type]['input_sheetname']]
	
	skip_header = False
	if type == 'App' and ws["A1"].value == "AppName":
		skip_header = True
	if type == 'Trap' and ws["A1"].value == "EventName":
		skip_header = True
	
	if type == 'App':
		sql_preamble = 'INSERT INTO `eventsApp` ( AppName, EventName, AlertMessage, \
			ThresholdValue, ThresholdUnit, EventSeverity, EventID, EventMessage, \
			AlertName, ThresholdName, EventGUID, AppGUID, AlertGUID, ThresholdGUID \
			) VALUES ('
	
	if type == 'Trap':
		sql_preamble = 'INSERT INTO `eventsTrap` ( 	`EventName`, `EventSeverity`, \
			`EventMessage`,	`EventGUID`, `PowerpackGUID` \
			) VALUES ('
	
	sql_epilogue = ' );'
		
	rowcount = 1
	for row in ws.rows:
		sql_values = ''
		#print "Row %d" % (rowcount)
		for cell in row:
			if skip_header == True and rowcount != 1:
				#print sql_values
				#sql_values = sql_values + ' \'' + cell.value + '\','
				sql_values = '%s \'%s\',' % (sql_values, cell.value)
				#print(cell.value)
		rowcount = rowcount + 1
		sql_values = sql_values[:-1]
		if skip_header == False or rowcount >= 3:
			sql_statement = sql_preamble + sql_values + sql_epilogue
			#print sql_statement	
			try:
				cur.execute(sql_statement)
			except e:
				print "Error %d: %s" % (e.args[0], e.args[1])
				dbh.rollback
	
	dbh.commit()
	cur.close()
	
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
	event_prequery = "SELECT EventName, AlertMessage, ThresholdValue, ThresholdUnit, EventSeverity, AppName \
	from eventsApp where EventGUID = '%s'"
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails_Trap(dbh, eventGUID, eventRoot):
	#pp.pprint('emed_getEventDetails_Trap')
	event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity \
	from eventsTrap where EventGUID = '%s'"
	event_query = event_prequery % (eventGUID)
	return emed_getEventDetailsFromSQL(dbh,event_query)

def emed_getEventDetails_TrapVarbind(dbh, eventGUID, eventRoot, tablename):
	#pp.pprint('emed_getEventDetails_TrapVarbind')
	#pp.pprint(tablename)
	event_prequery = "SELECT trapName as EventName, trapMessage as AlertMessage,\
		trapSeverity as EventSeverity from %s where trapCode = '%%s'" % (tablename)
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
	else:
		print "Unidentified Event Type: %s" % (eventtype)
		sys.exit(1)

	if 'eventsTrap' == eventtype or 'eventsTrapVarbind' == eventtype:
		eventRoot['data'][eventGUID]['ThresholdValue'] = ''
		eventRoot['data'][eventGUID]['ThresholdUnit'] = ''
		eventRoot['data'][eventGUID]['AppName'] = 'SNMP Trap'

	
def emed_getEventsDetails(dbh, eventtype, eventGUID, eventRoot):
	emed_getEventDetails(dbh, eventtype, eventGUID, eventRoot)
