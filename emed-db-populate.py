#!/usr/bin/env python

import MySQLdb as mdb
import sys
import json

import pprint

import time
from datetime import datetime

from emedUtil import emed_ConnectToEMED
from emedUtil import emed_ConnectToSQL
from emedLoadUtil import defineEM7ReadQueries
from emedLoadUtil import readEventDataFromEM7
from emedLoadUtil import loadEM7DataToEMED

pp = pprint.PrettyPrinter(indent = 1)

# Database connectivity
sdbname = 'staging'
crd_fname = "EVTM.crd"
sdbh = emed_ConnectToSQL(sdbname, crd_fname)

eventTypeData = {}

eventTypeList = ['Dynamic', 'Trap', 'Internal']
#eventTypeList = ['Internal']

try:
	defineEM7ReadQueries(eventTypeList, eventTypeData)
except ValueError, e:
	print "No read query defined for type '%s' in defineEM7ReadQueries()" % (e)
	sys.exit(1)

for eventType in eventTypeList:
	readEventDataFromEM7(eventType, eventTypeData, sdbh)

sdbh.close()

#edbname = 'emed'
#edbh = emed_ConnectToEMED(crd_fname)

for eventType in eventTypeList:
	loadEM7DataToEMED(eventType, eventTypeData)

