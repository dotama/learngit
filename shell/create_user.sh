#!/bin/sh
export ORACLE_SID=pciss
export ORACLE_BASE=/appl/oracle/app/oracle
export ORACLE_HOME=/appl/oracle/app/oracle/product/11.2.0/dbhome_1
export NLS_LANG="simplified Chinese_china".ZHS16GBK
export LANG="zh_CN.gbk"

#sqlplus -S / as sysdba @/appl/oracle/shell/sql/create_tablespace.sql
sqlplus -S / as sysdba @/appl/oracle/shell/sql/create_user.sql
