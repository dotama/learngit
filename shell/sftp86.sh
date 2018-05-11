#!/bin/sh
#create by tanggq 2018/05/10

HOST=10.112.35.86
USER=oracle
LOCAL_PATH=/appl/oracle/app/oracle/admin/pciss/dpdump
REMOTE_PATH=/oracle/oracle11g/admin/pciss/dpdump
CURR_PATH=`pwd`

echo `date +"%Y-%m-%d %H:%M:%S"`

# Get file string
echo -e "\nBegin to get file string..."
nameStr=`sftp $USER@$HOST <<EOF
cd $REMOTE_PATH
ls
bye
EOF`
echo $nameStr > remoteString.txt

# Get remote file list
nameList=$(cat remoteString.txt)
# File "remoteFile.txt" is add form, need to delete.
rm remoteFile.txt
echo $nameList
echo -e "\nBegin to write remote file list..."
for i in $nameList
do
  echo $i | grep gz$ | grep 0220 >> remoteFile.txt
done
cat remoteFile.txt

# Get local file
echo -e "\nBegin to get local file..."
cd $LOCAL_PATH
ls *0220*gz > $CURR_PATH/localFile.txt
cat $CURR_PATH/localFile.txt

# sftp file list
echo -e "\nFiles need to get..."
cd $CURR_PATH
diff localFile.txt remoteFile.txt > diffFile.txt
cut -c 3- diffFile.txt | grep \.gz > getFile.txt
cat getFile.txt

# fetch file
echo -e "\nBegin to fetch file..."
tempFile=$(cat getFile.txt)
for i in $tempFile
do
sftp $USER@$HOST << EOM
  lcd $LOCAL_PATH
  cd $REMOTE_PATH
  get $i
  bye
EOM
done

echo -e "\ndone\n\n\n"
