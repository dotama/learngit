echo `date`
echo "Starting gzip dump file..."
DUMP_DIR=/appl/oracle/app/oracle/admin/pciss/dpdump
#DUMP_DIR=/appl/oracle/test
cd $DUMP_DIR
find . -name 'pmss_autobak*.dmp' | xargs gzip -v
echo "Starting delete +30 days dump files and logs..."
echo `find . -mtime +30 -name 'pmss_autobak*'`
find . -mtime +30 -name 'pmss_autobak*' | xargs rm -f
echo -e "done.\n======================="
