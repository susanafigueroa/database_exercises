/*5 - Programar una función que calcule el factorial de un numeroq ue se le pase
como parametro. La función se llamará factorial.*/

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
