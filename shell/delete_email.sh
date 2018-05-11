#!/bin/sh
# Author: tanggq
# Date: 2018/01/18
# Delete test env email tables

export ORACLE_SID=pciss

sqlplus / as sysdba << EOM
  truncate table pmss.bsc_rpt_putonrecordi_set;
  truncate table pmss.bsc_rpt_putonrecordi_email;
  truncate table pmss.bsc_pdt_email_detail;
  truncate table pmss.bsc_mmbr_rptdlv;
  exit

EOM

