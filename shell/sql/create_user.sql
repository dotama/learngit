SPOOL create_user.log
--lock user
alter user pmss account lock;
--kill session
DECLARE
  i NUMBER(8) :=0;
BEGIN
  FOR i IN (SELECT ROWNUM rn,'alter system kill session '||''''||SID||','||SERIAL#||'''' killse FROM V$SESSION  WHERE USERNAME='PMSS')
  LOOP
    --dbms_output.put_line(i.rn||'  '||i.killse);
    EXECUTE IMMEDIATE i.killse;
  END LOOP;
END;
/
--create user
DROP USER pmss CASCADE;
CREATE USER pmss IDENTIFIED BY pmss DEFAULT TABLESPACE pmss_spc;
GRANT CONNECT,RESOURCE,DBA TO pmss;
GRANT CREATE MATERIALIZED VIEW TO pmss;
GRANT CREATE PUBLIC DATABASE LINK TO pmss;
GRANT CREATE TABLE TO pmss;
GRANT CREATE ANY PROCEDURE TO pmss;
SPOOL OFF
exit;
