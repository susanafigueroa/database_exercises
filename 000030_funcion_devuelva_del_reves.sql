/* 1- Realizar una función llamada DelReves que a partir de un codigo
de producto, nos devuelva el código de producto al revés.
Utilizar en una consulta de ejemplo para comprobar que funciona.

/*RESOLUCIÓN:*/

create or replace function DelReves(codigoUser jardineria_producto.codigo_producto%TYPE) 
return jardineria_producto.codigo_producto%TYPE
as

largadaCodigoUser number(5);
codigoUserReves jardineria_producto.codigo_producto%TYPE;

begin

largadaCodigoUser:=length(codigoUser);

for i in reverse 1..largadaCodigoUser loop--el bucle da tantas vueltas como dígitos tiene el codigoUser

    codigoUserReves:=codigoUserReves || substr(codigoUser,i,1);--necesito usar substr porque tengo que pillar cada letra de codigoUser
--en cada vuelta del bucle se van añadiendo las letras sueltas de codigoUser a codigoUserReves

end loop;

    return codigoUserReves;

end;
/






/*EJEMPLO PARA VER SI FUNCIONA O NO*/

select DelReves('FR-100') from dual;

