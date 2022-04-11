set serveroutput on;

-- MUESTRA TODOS LOS SUELDOS DE LA TABLA EMPLEADO CON SUS NOMBRES:
-- ejemplo de como trabaja un cursor recorriendo datos en una tabla
-- ejemplo de como trabaja un cursor actualizando datos de una tabla

-- CREAR CURSOR EXPLICITO QUE PERMITA RECORRER REGISTROS DE UA TABLA

declare
    variable_empleados empleados%rowtype;-- variable_empleados contendra
    -- todos los tipos de datos de la tabla empleados

begin
    for variable_empleados in (select * from empleados) loop -- con el bucle for
    -- ira recorriendo todos los registros de la tabla empleados
    dbms_output.put_line(variable_empleados.nombre || ' - ' ||variable_empleados.sueldo);--traera todos los sueldos

end loop;

end;



