SET SERVEROUTPUT ON SIZE 1000000
SPOOL recompiling.log
BEGIN
  FOR cur_rec IN (SELECT owner,
                         object_name,
                         object_type,
                         DECODE(object_type,'FUNCTION',1,'PROCEDURE',2 ,'PACKAGE', 3,
                                             'PACKAGE BODY', 4, 4) AS recompile_order
                  FROM   dba_objects
                  WHERE  object_type IN ('PACKAGE', 'PACKAGE BODY','FUNCTION','PROCEDURE')
                  AND    status != 'VALID'
                  ORDER BY 4,2)
  LOOP
    BEGIN
      IF cur_rec.object_type IN ( 'PACKAGE','FUNCTION','PROCEDURE') THEN
        EXECUTE IMMEDIATE 'ALTER ' || cur_rec.object_type || 
            ' "' || cur_rec.owner || '"."' || cur_rec.object_name || '" COMPILE';
      ElSE
        EXECUTE IMMEDIATE 'ALTER PACKAGE "' || cur_rec.owner || 
            '"."' || cur_rec.object_name || '" COMPILE BODY';
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(cur_rec.object_type || ' : ' || cur_rec.owner || 
                             ' : ' || cur_rec.object_name);
    END;
  END LOOP;
END;
/
SPOOL OFF
exit;