/* 1- Realizar una funci�n llamada DelReves que a partir de un codigo
de producto, nos devuelva el c�digo de producto al rev�s.
Utilizar en una consulta de ejemplo para comprobar que funciona.

/*Ejemplo de funci�n:
create or replace function Pagos_cliente(v_codigocliente clientes.codigocliente%type)
return Number
as
  v_sumapagos pagos.cantidad%type := 0;
begin
   
  select sum(cantidad) into v_sumapagos
  from pagos
  where codigocliente = v_codigocliente;
 
  return v_sumapagos;
 
end;
/

/*Ejemplo de llamada de la funci�n:
select Pagos_cliente(3) as Pagos_cliente_3 
from dual;






/*RESOLUCI�N:*/

create or replace function DelReves(codigoUser jardineria_producto.codigo_producto%TYPE) 
return jardineria_producto.codigo_producto%TYPE
as

largadaCodigoUser number(5);
codigoUserReves jardineria_producto.codigo_producto%TYPE;

begin

largadaCodigoUser:=length(codigoUser);

for i in reverse 1..largadaCodigoUser loop--el bucle da tantas vueltas como d�gitos tiene el codigoUser

    codigoUserReves:=codigoUserReves || substr(codigoUser,i,1);--necesito usar substr porque tengo que pillar cada letra de codigoUser
--en cada vuelta del bucle se van a�adiendo las letras sueltas de codigoUser a codigoUserReves

end loop;

    return codigoUserReves;

end;
/






/*EJEMPLO PARA VER SI FUNCIONA O NO*/

select DelReves('FR-100') from dual;

