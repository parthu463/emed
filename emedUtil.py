#!/usr/bin/env python

import MySQLdb as mdb
import sys

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
	
def createWS(wb, s, dbh, FormatWB=True):
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
		event_prequery = '';
		if 'eventsApp' == eventtype:
			event_prequery = "SELECT EventName, AlertMessage, ThresholdValue, ThresholdUnit, EventSeverity, AppName \
			from eventsApp where EventGUID = '%s'"
		elif 'eventsTrap' == eventtype:
			event_prequery = "SELECT EventName, EventMessage as AlertMessage, EventSeverity \
			from eventsTrap where EventGUID = '%s'"
		elif 'eventsTrapVarbind' == eventtype:
			event_prequery = "SELECT trapName as EventName, trapMessage as AlertMessage,\
				trapSeverity as EventSeverity from %s"
		else:
			print "Unidentified Event Type: %s" % (eventtype)
			sys.exit(1)
			
		try:
			for eventID in s[eventtype]:
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

				# Get the data for the row from the eventsApp table
				try:
					event_cur = dbh.cursor(mdb.cursors.DictCursor)
					event_query = event_prequery % (eventID)
					pp.pprint(event_query)
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
				
				if 'eventsTrap' == eventtype or 'eventsTrapVarbind' == eventtype:
					event['ThresholdValue'] = ''
					event['ThresholdUnit'] = ''
					event['AppName'] = 'SNMP Trap'
				
				ws[cellA_ID] = event['EventName']
				c=ws[cellA_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellB_ID] = event['AlertMessage']
				c=ws[cellB_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellC_ID] = event['ThresholdValue']
				c=ws[cellC_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				if event['ThresholdUnit'] != 'NULL':
					ws[cellD_ID] = event['ThresholdUnit']
				c=ws[cellD_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor) 
#				# eventsTrapVarbind severities are already strings
				if isinstance(event['EventSeverity'], int):
					ws[cellE_ID] = severityMapping[event['EventSeverity']]
				else:
					ws[cellE_ID] = event['EventSeverity']
				c=ws[cellE_ID]
				if FormatWB:
					c.fill = PatternFill('solid', fgColor=rowfillcolor)
				ws[cellF_ID] = event['AppName']
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
	