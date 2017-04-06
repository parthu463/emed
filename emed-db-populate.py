#!/usr/bin/env python

import MySQLdb as mdb
import sys
import json

import pprint

import time
from datetime import datetime

from emedUtil import loadWStoEMED

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


EventTypeData = {}
EventTypeData['App'] = {}
EventTypeData['Trap'] = {}

EventTypeData['App']['fname'] = 'Events-App_20170403-1849.xlsx'
EventTypeData['App']['input_sheetname'] = 'eventsApp'

EventTypeData['Trap']['fname'] = 'Events-Trap_20170329-01.xlsx'
EventTypeData['Trap']['input_sheetname'] = 'eventsTrap'

loadWStoEMED('App', EventTypeData, dbh)
loadWStoEMED('Trap', EventTypeData, dbh)

dbh.close()
