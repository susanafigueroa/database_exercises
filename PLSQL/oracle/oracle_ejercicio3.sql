SET SERVEROUTPUT ON;

DECLARE

radio number(3,1);
pi constant number(3,2) := 3.14;

BEGIN

radio := &radio;

DBMS_OUTPUT.PUT_LINE('el radio de la circumferencia es : ' || radio || ' y el �rea es ' ||pi*(radio*radio));

END;