#DATA_PUMP_DIR=/appl/oracle/app/oracle/admin/pciss/dpdump/
echo "Oracle Schemas=PMSS auto back up starting..."
DATE=`date +%Y%m%d%H%M%S`
echo "expdp pmss/pmss directory=DATA_PUMP_DIR dumpfile=pmss_autobak_$DATE.dmp logfile=pmss_autobak_$DATE.log SCHEMAS=PMSS content=all"
expdp pmss/pmss directory=DATA_PUMP_DIR dumpfile=pmss_autobak_$DATE.dmp logfile=pmss_autobak_$DATE.log SCHEMAS=PMSS content=all
echo "Oracle auto backup done."

