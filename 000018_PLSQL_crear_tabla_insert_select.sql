-- EJERCICIO2:

-- Modificar el script del ejercicio 1 para que si el salario medio del 
-- departamento es menor a 6000 entonces insertar en la nueva tabla M los datos
-- de los trabajadores, con su salario con una subida del 30%.

-- creacion de la tabla M:

    create table M (
        employee_id int not null primary key,
        department_id int not null,
        new_salary number(5) not null,
        constraint fk1 foreign key (employee_id) references employees(employee_id),
        constraint fk2 foreign key (department_id) references departments(department_id));


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
            
            -- REALIZO AQUI LA MODIFICACION DEL SCRIPT:
            
            if media < 6000 then
                            
                insert into M (employee_id, department_id, new_salary)
                    select employees.employee_id, employees.department_id, (employees.salary*1.3)
                    from employees
                    where department_id = idDep;     
            
            end if;

        else
        
            DBMS_OUTPUT.PUT_LINE('El department_id NO existe');  
        
        end if;
    
    else
    
        DBMS_OUTPUT.PUT_LINE('Error, el department_id introducido no puede ser negativo');  
    
    end if;

END;
