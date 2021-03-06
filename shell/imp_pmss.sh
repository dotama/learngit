#!/bin/sh
# Author: tanggq
# Date: 2018/01/26
export ORACLE_SID=pciss

#find newest dmp file. Cause find result with string './' , so choose command ls
#FILE_NAME=`find ./ -name '*.dmp*' ! -name '*.log' | xargs ls -t | head -1`
DP_DIR=/appl/oracle/app/oracle/admin/pciss/dpdump/
cd $DP_DIR
FILE_NAME=`ls -t pmss_autobak*.dmp.gz pmss_autobak*.dmp | head -1`
if [ "${FILE_NAME##*.}" = "gz" ]; then
	gzip -dv $FILE_NAME
	echo $FILE_NAME
	FILE_NAME=`ls -t pmss_autobak*.dmp.gz pmss_autobak*.dmp | head -1`
	echo $FILE_NAME
fi
echo "impdp pmss/pmss@pciss directory=DATA_PUMP_DIR dumpfile=$FILE_NAME \
logfile=$FILE_NAME.log SCHEMAS=PMSS content=all table_exists_action=replace"
impdp pmss/pmss@pciss directory=DATA_PUMP_DIR dumpfile=$FILE_NAME \
logfile=$FILE_NAME.log SCHEMAS=PMSS content=all table_exists_action=replace

