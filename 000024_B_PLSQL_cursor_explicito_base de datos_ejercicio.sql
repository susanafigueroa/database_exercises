set serveroutput on;

-- Cursor explicito: cursor declarado y controlado por el programador
-- que lo configura
-- Se usa para consultas que devuelven mas de un registro, o consultas que
-- devuelven 1 solo registro, para que sea mas eficiente.

-- partes:
-- 1.declare -> donde se define el nombre del cursor que usaremos
-- y la consulta que se va a ejecutar
-- 2.donde se abre el cursor, que es donde se ejecuta la sentencia
-- select, el resultado se guarda en el servidor en un area
-- de memoria (tablas temporales de oracle) -> se retornan los resultados
-- a la vez que se van pidiendo
-- 3.fetch -> donde se recuperan cada una de las filas de la consulta 
-- ejecutada dentro del cursor, una vez el cursor este abierto se puede hacer
-- la recuperacion
-- 4.empty -> evaluacion de la consulta extraida, si la consulta no cumple
-- con la condicion dada se vuelve a fetch, si cumple con la condicion se procede
-- a cerrar el cursor. ES SUPER IMPORTANTE CERRAR EL CURSOR para liberar los
-- objetos temporales almacenados 

declare
    variable_documento empleados.documento%type;
    variable_nombre empleados.nombre%type;
    variable_apellido empleados.apellido%type;
    variable_sueldo empleados.sueldo%type;

    cursor cursor2 is
        select documento, nombre, apellido, sueldo
        from empleados
        where documento = 22222222;

begin
    open cursor2;
    fetch cursor2 into variable_documento, variable_nombre, variable_apellido, variable_sueldo;
    close cursor2;--siempre se tiene que cerrar el cursor!
    dbms_output.put_line('Documento: ' || variable_documento);
    dbms_output.put_line('Nombre: ' || variable_nombre);
    dbms_output.put_line('Apellido: ' || variable_apellido);
    dbms_output.put_line('Sueldo: ' || variable_sueldo);

end;
    