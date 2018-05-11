#!/bin/sh
. /appl/oracle/.bash_profile
export ORACLE_SID=pciss

echo "begin to recreate user pmss..."
/appl/oracle/shell/create_user.sh
echo "begin to import newest database..."
/appl/oracle/shell/daily_import.sh
echo "truncate tables..."
/appl/oracle/shell/delete_email.sh
echo "recompile invalid packages, functions and procedures..."
/appl/oracle/shell/recompiling_all.sh
echo "gzip dump file..."
/appl/oracle/shell/deal_dump_file.sh
echo "success!"

