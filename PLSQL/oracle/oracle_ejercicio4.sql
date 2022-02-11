#tiene que pedirle al usuario que inserte el nombre, y contesta Hola 'nombre'

SET SERVEROUTPUT ON;

DECLARE

name VARCHAR2(100);

BEGIN

name := &name ;

DBMS_OUTPUT.PUT_LINE('Hola '||name);

END;
