-- EJERCICIO1: con la funcion avg para sacar la media del salario

-- Bloque PL/SQL que devuelva el salario de un departamento, introducido por el
-- usuario (department_id).

-- Controlar que el departamento no sea negativo y que exista.

-- La salida ha de mostrar lo siguiente: ejemplo:
    -- 20 - Marketing - El salario medio de este departamento es de 21000
    
-- ejemplo de query para obtener el salario medio de un departamento:
-- como tengo el salary y el department_id en la tabla employees, puedo 
-- hacer directamente el avg(e.salary) donde el departament_id sea uno especifico:

select avg(e.salary)
from employees e
where e.department_id = 50;


-- ejemplo de query para saber si el department_id introducido por el usuario
-- existe:

select count(dep.department_id)
from departments dep
where dep.department_id = 50;


-- RESPUESTA:
SET SERVEROUTPUT ON;

DECLARE

    -- variable donde se guardara el department_id introducido por el usuario
    department_id_user departments.department_id%TYPE := &department_id_user; 
    
    -- tendre que comprovar que el department_id introducido por el usuario existe
    existeDepartment number(1);
    
    -- variable donde se guardara la media del salario del departamento introducido
    -- por el usuario:
    media number(10);
    
    -- variable donde se guardara el nombre del departamento
    nombreDepartamento departments.department_name%TYPE;
    
BEGIN

    -- primero miro si existe el departamento introducido por el usuario:
    select count(dep.department_id) into existeDepartment
    from departments dep
    where dep.department_id = department_id_user;
    
    if existeDepartment = 1 then
    
        DBMS_OUTPUT.PUT_LINE('el departamento introducido '||department_id_user||' existe.');   
        
        -- una vez se que existe el departamento, procedo a calcular la media del salario con avg:
        select avg(e.salary) into media
        from employees e
        where e.department_id = department_id_user;
        
        -- tambien necesito saber el nombre del departamento:
        select dep.department_name into nombreDepartamento
        from departments dep
        where dep.department_id = department_id_user;
        
        DBMS_OUTPUT.PUT_LINE('-- '||department_id_user||' - '||nombreDepartamento||' - El salario medio de este departamento es de '||media);
        
    
    else
    
        DBMS_OUTPUT.PUT_LINE('ERROR, el departamento introducido '||department_id_user||' NO existe.');
    
    end if;

END;
