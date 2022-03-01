-- Ejercicio 9: Programar un script que nos muestre los numeros entre un rango.
-- El rango mínimo es 1 y el maximo se le tiene que preguntar al usuario.
-- a) programar el script usando FOR
-- b) programar el script usando WHILE

SET SERVEROUTPUT ON;

DECLARE

    maxim number(5);
    
    a number(5);
    
BEGIN
    
    maxim := &maxim;
    
    FOR i in 1..maxim
    loop
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;
    
    a := 1;
    
    while ( a <= maxim ) loop
        if ( a != (maxim+1)) then
            DBMS_OUTPUT.PUT_LINE(a);
            a := a+1;
        else
            exit;
        end if;
    end loop;
            
END;
