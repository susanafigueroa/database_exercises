SET SERVEROUTPUT ON;

DECLARE

number1 number(3,1) := 10.2 ;
number2 number(3,1) := 20.1 ;
suma number(3,1) := number1 + number2;

BEGIN

DBMS_OUTPUT.PUT_LINE('LA SUMA ES : ' || suma);

END;