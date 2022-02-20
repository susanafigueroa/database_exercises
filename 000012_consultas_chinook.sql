-- 1. Base de datos

-- Utilizar la Base de Datos CHINOOK

use chinook;

-- ejercicio1: Consulta que muestre los clientes (solo sus nombres completos, ID de cliente y país)
-- que no se encuentren en los EE. UU.

select * from customer;

select c.FirstName, c.LastName, c.CustomerId, c.Country
from customer c
where c.Country != 'USA';



-- ejercicio2: Consulta que muestre solo los clientes de Brasil.

select c.FirstName, c.LastName
from customer c
where c.Country like 'Brazil';

	-- otra opción:

select c.FirstName, c.LastName
from customer c
where c.Country = 'Brazil';



-- ejercicio3: Consulta que muestre las facturas de los clientes que son de Brasil. La tabla resultante
-- debe mostrar el nombre completo del cliente, el ID de la factura, la fecha de la factura
-- y el país de facturación.

select * from invoice;
select * from customer;

	-- primero busco los CustomerId de los que son de Brasil:

select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate
from invoice i
inner join customer c on c.CustomerId = i.CustomerId
where i.CustomerId in (
	select c.CustomerId
	from customer c
	where c.Country = 'Brazil');



-- ejercicio4: Consulta que muestre solo los empleados que son agentes de ventas */

select * from employee;

select e.FirstName, e.LastName
from employee e
where e.Title = 'Sales Support Agent';



-- ejercicio5: Consulta que muestre una lista única de países de facturación de la tabla Factura */

select * from invoice;

select i.BillingCountry
from invoice i;



-- ejercicio6:  Consulta que muestre las facturas asociadas a cada agente de ventas. La tabla
-- resultante debe incluir el nombre completo del agente de ventas. */

	-- primero necesito saber los e.EmployeeId de los agentes de ventas

select e.EmployeeId
from employee e
where e.Title like 'Sales Support Agent';

	-- ahora necesito saber los c.CustomerId que tienen estos empleados:

select c.CustomerId, c.SupportRepId 
from customer c
where c.SupportRepId in (
	select e.EmployeeId
	from employee e
	where e.Title like 'Sales Support Agent');

	-- ahora necesito saber los InvoiceId asociados a los CustomerId:

select i.InvoiceId, e.FirstName, e.LastName
from invoice i
inner join customer c on c.CustomerId = i.CustomerId
inner join employee e on e.EmployeeId = c.SupportRepId 
where i.CustomerId in (
	select c.CustomerId 
	from customer c
	where c.SupportRepId in (
		select e.EmployeeId
		from employee e
		where e.Title like 'Sales Support Agent'));



-- ejercicio7: Consulta que muestre el total de la factura, el nombre del cliente, el país y el nombre
-- del agente de ventas para todas las facturas y clientes.*/

select * from invoice i; -- Total	
select * from customer c; -- 
select * from employee e; -- 

select i.Total, c.FirstName, c.LastName, c.Country, e.FirstName, e.LastName	
from invoice i
inner join customer c ON c.CustomerId = i.CustomerId 
inner join employee e ON e.EmployeeId = c.SupportRepId;


	
-- ejercicio8: ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas
-- para cada uno de esos años?

select * from invoice;

select count(i.InvoiceId) as facturas, i.InvoiceDate 
from invoice i
group by i.InvoiceDate
where i.InvoiceDate like '2009%'; ?????????



-- ejercicio9: Número de ítems para la factura 37*/

select * from invoiceline il;

select count(il.InvoiceLineId) as items
from invoiceline il
where il.InvoiceId = 37;



-- ejercicio10: Número de ítems de cada factura*/

select * from invoiceline il;

select count(il.InvoiceLineId) as items, il.InvoiceId
from invoiceline il
group by il.InvoiceId;



-- ejercicio11: Consulta que devuelva el número de facturas por país*/

select * from invoice i;

select count(i.InvoiceId) as countFacturas, i.BillingCountry 
from invoice i
group by i.BillingCountry;



-- ejercicio12: Consulta que muestre todas las facturas, pero incluya el número de ítems de la factura.*/

select * from invoiceline il;

	-- busco la cantidad de items de cada factura

select count(il.InvoiceLineId) as quantItems, il.InvoiceId 
from invoiceline il
group by il.InvoiceId;



-- ejercicio13: Nombre y nº de ventas de la canción más vendida de 2013.*/

select * from invoiceline il;
select * from invoice i;

	-- busco las canciones vendidas en 2013 ?????????????????

select i.InvoiceId
from invoice i
where i.InvoiceDate = '2013%';

	-- agrupo las invoiceLineId en grupos de TrackId para saber la cantidad vendida de cada TrackId

select count(il.InvoiceLineId) as quantCanciones, il.TrackId
from invoiceline il
group by il.TrackId
where 
order by quantCanciones desc
limit 1;
