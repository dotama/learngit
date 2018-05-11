#!/bin/sh
export ORACLE_SID=pciss

sqlplus -S pmss/pmss @/appl/oracle/shell/sql/recompiling_invalid.sql

