#!/bin/sh

HOST=10.112.32.135
USER=oracle
#LOCAL_PATH=/appl/oracle/test
LOCAL_PATH=/appl/oracle/app/oracle/admin/pciss/dpdump
cd $LOCAL_PATH
FILE_NAME=`ls -t *.dmp.gz | head -1`
#REMOTE_PATH=/home/oracle/tmp
REMOTE_PATH=/home/oracle/app/oracle11g/admin/pciss/dpdump
echo $FILE_NAME
sftp $USER@$HOST << EOM
  lcd $LOCAL_PATH
  cd $REMOTE_PATH
  put $FILE_NAME
  bye
EOM

echo "Success!"
