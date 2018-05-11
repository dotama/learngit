--create tablespace
CREATE TABLESPACE pmss_spc
LOGGING
DATAFILE '/appl/oracle/app/oracle/oradata/pciss/pmss_spc.dbf'
SIZE 5000m
AUTOEXTEND ON
NEXT 50m MAXSIZE 20480m
EXTENT MANAGEMENT LOCAL;
