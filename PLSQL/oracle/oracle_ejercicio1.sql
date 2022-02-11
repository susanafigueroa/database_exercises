#pgm que muestre la fecha actual

SET SERVEROUTPUT ON;

DECLARE

    A VARCHAR(10) := '';

BEGIN

    SELECT TO_CHAR(SYSDATE) INTO A FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('LA FECHA ACTUAL ES: '|| A);

END;
