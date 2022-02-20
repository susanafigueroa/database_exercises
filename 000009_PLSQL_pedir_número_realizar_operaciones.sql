-- El programa tiene que pedir un número, al que se le aplicará
-- suma, resta y multiplicación
    -- usa variable distinta para cada operación
    -- imprime por pantalla los distintos resultados

SET SERVEROUTPUT ON;

DECLARE

    numero number(5);
    
    suma number(5) := 4;
    
    resta number(5) := 3;
    
    multi number(5) := 8;
    
    opSuma number(5);
    
    opResta number(5);
    
    opMulti number(5);

BEGIN

    numero := &numero;
    
    opSuma := numero + suma;
    
    opResta := numero - resta;
    
    opMulti := numero * multi;
    
    DBMS_OUTPUT.PUT_LINE('la suma es '||opSuma);
    
    DBMS_OUTPUT.PUT_LINE('la resta es '||opResta);
    
    DBMS_OUTPUT.PUT_LINE('la multiplicación es '||opMulti);

END;
