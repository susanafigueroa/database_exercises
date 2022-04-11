set serveroutput on;

-- ACTUALIZAR DATOS DE LA TABLA CON CURSOR
-- USAR LA BASE DE DATOS QUE SE ENCUENTRA EN EL ARCHIVO: 000024_A_PLSQL_cursor_explicito_base_de_datos_para_el_ejercicio.sql

begin -- como vamos a actualizar, no necesitamos declarar variable
  update empleados set sueldo = 10000
  where documento = '23333333';
  if sql%notfound then
    dbms_output.put_line('NO EXISTE REGISTRO PARA MODIFICAR');
  end if;
end;
/

select * from empleados;



