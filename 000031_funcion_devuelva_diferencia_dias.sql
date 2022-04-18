/*2- Desarrolla una función llamada DifDias que devuelva la diferencia de días
entre la fecha de pedido y la fecha de entrega
para un pedido introducido por el usuario.*/

/*para calcular los días que hay entre dos fechas:
select trunc(fecha_final)-trunc(fecha_inicial)*/

create or replace function DifDias(codigo jardineria_pedido.codigo_pedido%TYPE)
return Number
as
  dias number(5);
begin
  
  select trunc(jardineria_pedido.fecha_entrega)-trunc(jardineria_pedido.fecha_pedido) into dias
  from jardineria_pedido jardineria_pedido
  where jardineria_pedido.codigo_pedido = codigo;
 
  return dias;
 
end;
/

/*PARA VER SI FUNCIONA*/
select DifDias(114) from dual;






















