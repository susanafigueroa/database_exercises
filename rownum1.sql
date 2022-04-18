/*3- Escribir un procedimiento almacenado que visualice el apellido 
y el limite de credito de los cinco clientes que más
dinero se han gastado.*/


create or replace procedure ex3 is

    apellido jardineria_cliente.apellido_contacto%type;
    
    limite jardineria_cliente.limite_credito%type;
    
    cod jardineria_cliente.codigo_cliente%type;

begin

    for i in 1..5 loop
        select codigo_cliente into cod from
            (select rownum as r, codigo_cliente from
                (select codigo_cliente from jardineria_pago group by codigo_cliente order by sum(total) desc))
        where r = i;
        
        select apellido_contacto into apellido from jardineria_cliente where codigo_cliente = cod;
        
        select limite_credito into limite from jardineria_cliente where codigo_cliente = cod;
        
        dbms_output.put_line('cliente '||apellido);
        
        dbms_output.put_line('limite: '||limite);
        
    end loop;
    
end;