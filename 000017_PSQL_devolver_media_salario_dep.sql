-- EJERCICIO1:

-- Bloque PL/SQL que devuelva el salario de un departamento, introducido por el
-- usuario (department_id).

-- Controlar que el departamento no sea negativo y que exista.

-- La salida ha de mostrar lo siguiente: ejemplo:
    -- 20 - Marketing - El salario medio de este departamento es de 21000
    
-- ejemplo query 1: necesito sacar la media del salario, para ello necesito el sumatorio de los distintos
-- salarios que le corresponden al department_id específico, en este caso uso como
-- ejemplo el department_id = 50:
Select sum(e.salary) 
from employees e
where e.department_id = 50;

-- ejemplo query 2: para hacer la media, necesito la cantidad de empleados que hay en el departamento
-- específico, realizo el count con el ejemplo de department_id = 50:
Select count(e.employee_id)
from employees e
where e.department_id = 50;

-- ejemplo query 3: para saber el nombre del departamento introducido por el usuario, en este caso
-- uso de ejemplo el department_id = 50:
Select d.department_name
from departments d
where d.department_id = 50;

-- ejemplo query 4: para ver si existe o no uso un count:
select count(d.department_id) from departments d where d.department_id = 50;


-- RESPUESTA:
SET SERVEROUTPUT ON;

DECLARE
    -- variable para guardar el department_id introducido por el usuario:
    idDep employees.department_id%TYPE;
    
    -- variable para guardar el salario total del departamiento introducido por
    -- el usuario:
    salario number(10);

    -- variable para guardar la cantidad de trabajadores que trabajan en el 
    -- departamento introducido por el usuario:
    cantidadTrabajadores number(10);
    
    -- variable para guardar el nombre del departamento que le corresponde al
    -- department_id introducido por el usuario:
    nombre_departamento departments.department_name%TYPE;
    
    -- variable para guardar la media del salario introducido por el usuario:
    media number(5);
    
    -- variable para saber si existe el department_id introducido por el usuario,
    -- si existe, existe = 1, si no existe, existe = 0:
    existe number(1);
    
BEGIN

    -- pido el department_id al usuario
    idDep := &idDep;
    
    -- primera restriccion: el departamento no puede ser negativo, por tanto:
    
    if idDep > 0 then
    
        DBMS_OUTPUT.PUT_LINE('El department_id introducido es positivo.');  
                 
        -- miro si existe el departamento introducido o no:
        select count(d.department_id) into existe
        from departments d
        where d.department_id = idDep;
        
        if existe = 1 then
        
            DBMS_OUTPUT.PUT_LINE('el departamento '||idDep||' existe.');          
            
            -- guardo el salario total del departamiento introducido dentro de la variable salario
            Select sum(e.salary) into salario from employees e where e.department_id = idDep;
        
            -- guardo el total de empleados que trabajan en el departamiento introducido:
            Select count(e.employee_id) into cantidadTrabajadores from employees e where e.department_id = idDep;
            
            -- guardo el nombre del departamento introducido:
            Select d.department_name into nombre_departamento from departments d where d.department_id = idDep;
            
            -- guardo la media dentro de la variable media:
            media := salario / cantidadTrabajadores;
        
            DBMS_OUTPUT.PUT_LINE('numero de idDep: '||idDep);
            DBMS_OUTPUT.PUT_LINE('cantidad de trabajadores: '||cantidadTrabajadores);
            DBMS_OUTPUT.PUT_LINE('nombre del departamento: '||nombre_departamento);
            DBMS_OUTPUT.PUT_LINE('salario total del departamento: '||salario);
            DBMS_OUTPUT.PUT_LINE('media del salario del departamento: '||media);
            DBMS_OUTPUT.PUT_LINE('respuesta final: '||idDep||' - '||nombre_departamento||' - El salario medio de este departamento es de '||media);
        
        else
        
            DBMS_OUTPUT.PUT_LINE('El department_id NO existe');  
        
        end if;
    
    else
    
        DBMS_OUTPUT.PUT_LINE('Error, el department_id introducido no puede ser negativo');  
    
    end if;

END;
