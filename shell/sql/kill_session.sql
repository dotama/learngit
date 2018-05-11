SPOOL kill_session.log
alter user pmss account lock;

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
--DROP USER pmss CASCADE;
SPOOL OFF

exit;
