/*5 - Programar una función que calcule el factorial de un numeroq ue se le pase
como parametro. La función se llamará factorial.*/

/*Ejemplo de función:
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

/*Ejemplo de llamada de la función:
select Pagos_cliente(3) as Pagos_cliente_3 
from dual;


/*el for factorial en java:*/
/*for ( int i = number; i > 1; i--){
fact = fact * i;
}*/


/*RESOLUCIÓN:*/
create or replace function Factorial(numeroIntroducido number)
return number
as

    numeroFactorial number := 1;
        
begin

    for i in 1 .. numeroIntroducido loop
        
        numeroFactorial := numeroFactorial * i;
    
    end loop;
   
return numeroFactorial;
   
end;
/

/*COMPROBAR QUE FUNCIONE GUAI*/
select Factorial(10) from dual;
