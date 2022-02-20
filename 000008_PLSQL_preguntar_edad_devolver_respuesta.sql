-- Preguntar al usuario su edad y dar el mensaje correspondiente

SET SERVEROUTPUT ON;

DECLARE

    edad number(3);


BEGIN

    edad := &edad;

    if edad < 18 and edad >= 0 THEN
    
    DBMS_OUTPUT.PUT_LINE('ets menor dedat');
    
    elsif edad = 18 THEN
    
    DBMS_OUTPUT.PUT_LINE('¡casi eres mayor de edad!');
    
    elsif edad > 18 and edad <= 40 THEN
    
    DBMS_OUTPUT.PUT_LINE('¡ya eres mayor de edad!');
    
    elsif edad >40 THEN
    
    DBMS_OUTPUT.PUT_LINE('¡eres viejoven!');
    
    else
    
    DBMS_OUTPUT.PUT_LINE('ERROR: la edad no puede ser negativa');
    
    END IF;

END;
