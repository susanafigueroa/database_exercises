use miniwind;

-- Consultas en la base de datos miniwind.sql

-- Ejercicio1: Seleccionar de la tabla employees todos los empleados de Washington.
-- Se tienen que ordenar los resultados por el apellido.
-- Los datos que se tienen que mostrar son:
	-- el identificador del empleado
	-- el apellido
	-- la posición laboral (job_title) que ocupa

select * from employees e;

select e.id, e.first_name, e.last_name, e.job_title 
from employees e
where e.city = 'Washington';



-- Ejercicio2: Muestra:
	-- el identificador
	-- el nombre
	-- el apellido de los empleados que empiecen por "J"

select * from employees e;

select e.id, e.first_name, e.last_name
from employees e
where e.last_name like 'J%';



-- Ejercicio3: Muestra los apellidos de la tabla employees que tengan una "e" en la segunda posición.

select * from employees e;

select e.last_name 
from employees e
where e.last_name like '_e%';



-- Ejercicio4: Muestra los nombres de la tabla employees que empiecen por "T" y que contengan una "e".

select * from employees e;

select e.first_name
from employees e
where e.first_name like 'T%' and e.first_name like '%e%';



-- Ejercicio5: Muestra el apellido de los empleados, la posición de los cuales es "Sales Manager", "Sales Representative", o "Sales Coordinator".

select * from employees e;

select e.first_name, e.last_name, e.job_title
from employees e
where e.job_title like ('Sales Manager') or (e.job_title like 'Sales Representative') or (e.job_title like 'Sales Coordinator');



-- Ejercicio7: Muestra los apellidos de los empleados que no ocupen ninguna de las tres posiciones anteriores.

select * from employees e;

select e.first_name, e.last_name, e.job_title
from employees e
where e.job_title not like ('Sales Manager') and (e.job_title not like 'Sales Representative') and (e.job_title not like 'Sales Coordinator');



-- Ejercicio8: Muestra una lista de empleados de Washington que sepan francés (se dice en las notas) y de Atlanta que no sepan.
-- Queremos ver su identificador, el nombre, el apellido, la ciudad y las notas.

select * from employees e;

select e.id, e.first_name, e.last_name, e.city, e.notes
from employees e
where e.notes like '%French%';



-- Ejercicio9: Muestra el nombre y el proveedor de los productos de la tabla products que sean solo del proveedor (supplier_ids) número 4 o solo del 10.

select * from products p;

select p.product_name, p.supplier_ids
from products p
where (p.supplier_ids = 4) or (p.supplier_ids = 10);



-- Ejercicio10: Muestra el nombre y el proveedor de los productos de la tabla productos que NO sean solo del proveedor 4 ni solo del 10.

select * from products p;

select p.product_name, p.supplier_ids
from products p
where (p.supplier_ids != 4) and (p.supplier_ids != 10);



-- Ejercicio11: Obtén el nombre y el precio de los productos de los cuales (list_price) están comprendidos entre 10 y 20 (incluídos).

select * from products p;

select p.product_name, p.list_price
from products p
where p.list_price between 10 and 20;



-- Ejercicio12: Obtén el nombre y el precio de los productos el precio de los cuales NO está comprendido entre 10 y 20.

select * from products p;

select p.product_name, p.list_price
from products p
where p.list_price not between 10 and 20;



-- Ejercicio13: Obtén el nombre de los productos, el precio y el número del proveedor que tengan un precio superior a
-- 20 y que sean solo del proveedor número 4 o solo del número 10. Escribe la sentencia de dos formas distintas.

select * from products p;

select p.product_name, p.list_price, p.supplier_ids
from products p
where (p.list_price > 20) and ((p.supplier_ids = 4) or (p.supplier_ids=10));


