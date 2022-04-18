/*
4- Procedimiento almacenado que al pasarle un codigo de cliente, nos liste lo siguiente
( en el mismo formato que la imagen )
- Código cliente, nombre, ciudad, pais
- Cantidad total pagada.
Omitir los pagos realizados.
*/

create or replace procedure exec_pagos_clientes(codigo jardineria_cliente.codigo_cliente%type) 
is 

nom jardineria_cliente.nombre_cliente%type;
ciudad jardineria_cliente.ciudad%type;
pais jardineria_cliente.pais%type;
totalPagos int;

begin

    select nombre_cliente into nom from jardineria_cliente where codigo_cliente = codigo;
    select ciudad into ciudad from jardineria_cliente where codigo_cliente = codigo;
    select pais into pais from jardineria_cliente where codigo_cliente = codigo;
    
    dbms_output.put_line('Código Cliente: '|| codigo);
    dbms_output.put_line('Nombre Cliente: '|| nom);
    dbms_output.put_line('Ciudad Cliente: '|| ciudad);
    dbms_output.put_line('País Cliente: '|| pais);
    
    select sum(jp.total) into totalPagos from jardineria_cliente jc
    inner join jardineria_pago jp on jp.codigo_cliente = jc.codigo_cliente 
    where jc.codigo_cliente = codigo;

    dbms_output.put_line('TOTAL PAGOS EFECTUADOS: ' || totalPagos);
    
end;
