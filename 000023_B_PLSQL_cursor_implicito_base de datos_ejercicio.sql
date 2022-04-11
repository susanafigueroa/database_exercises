set serveroutput on; 

-- EJEMPLO CURSOR IMPL�CITO : crea un cursor que haga actualizaci�n de salarios
-- que sean mayores o iguales a una cifra, para que el cursor pueda
-- identificar cifras que coincidan con la cifra espec�fica e informe de cuales
-- son las actualizaciones y que indique tambi�n que no ha enconrado la cifra

-- un cursor es un objeto de plsql que funciona como programa, el programa
-- va dentro de un bloque de plsql: tendremos la seccion declare, begin y end

declare
    filas number(2);
begin
    update empleados -- actualiza la tabla empleados
    set sueldo = sueldo + 500 where sueldo >= 3000; -- establece que el campo sueldo sea igual al valor del sueldo + 500

    if sql%notfound then -- si no hay ningun salario mayor o igual a 9000
        dbms_output.put_line('==NO HAY EMPLEADOS DISPONIBLES==');
    elsif sql%found then
        filas:=sql%rowcount;-- contar las filas que coinciden
        dbms_output.put_line(filas || ': EMPLEADOS ACTUALIZADOS');
    end if;
end;

