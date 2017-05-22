#!/bin/bash

EVENTSSQLSCRIPT='sql/DAEvents.sql'

DATE='/usr/bin/date'
SED='/usr/bin/sed'
BASENAME='/usr/bin/basename'
MYSQL='/usr/bin/mysql'
RM='/usr/bin/rm'
HOSTNAME='/usr/bin/hostname'
AWK='/usr/bin/awk'

FNAMEBASE=`${BASENAME} ${0} '.sh'`
NOW=`${DATE} '+%Y%m%d-%H%M'`
STACK=`${HOSTNAME} | ${AWK} -F '-' '{print $4}'`
STACKNAME="stack${STACK}"
FNAME="${FNAMEBASE}-${STACKNAME}-${NOW}.out"

${MYSQL} -u root -p < ${EVENTSSQLSCRIPT} | ${SED} -e 's///g' > ${FNAME}

if [ ! -s ${FNAME} ]; then
$RM -f ${FNAME}
fi
