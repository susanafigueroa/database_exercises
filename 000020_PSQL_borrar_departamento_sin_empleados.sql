-- Si el departamento introducido no tiene empleados, borrarlo:

select * from departments;

select * from employees;

-- para saber si el id del departamento contiene empleados, ese id del departamento
-- existe en la tabla employees. hago un count de la cantidad de empleados agrupados
-- por grupos de departamento: ejemplo query:

select count(e.employee_id) as cantidadEmpleados, e.department_id
from employees e
group by e.department_id;

-- ahora para saber si el departamento introducido tiene empleados, hago
-- la siguiente query: si el count es nulo significa que el departamento no tiene
-- empleados y por tanto podré borrarlo: ejemplo query:

select count(e.employee_id) as cantidadEmpleados, e.department_id
from employees e
group by e.department_id
having e.department_id = 50;



SET SERVEROUTPUT ON;

DECLARE

    department_id_user employees.department_id%TYPE := &department_id_user;
    
    cantidadEmpleados number(5);
    
    -- para saber si el departamento introducido existe:
    existeDepartamento number(1);

BEGIN

    -- primero quiero saber si ese departamento introducido existe: si existeDepartamento
    -- es 1, existe, si es 0, no existe:
    select count(dep.department_id) into existeDepartamento
    from departments dep
    where dep.department_id = department_id_user;

    if existeDepartamento = 1 then
    
        DBMS_OUTPUT.PUT_LINE('el departamento '||department_id_user||' existe');
        
        select count(e.employee_id) into cantidadEmpleados
        from employees e
        where e.department_id = department_id_user;
    
        if cantidadEmpleados != 0 then

            DBMS_OUTPUT.PUT_LINE('el departamento '||department_id_user||' tiene '||cantidadEmpleados||' empleados. Por tanto no borramos ese departamento.');

        else
        
            DBMS_OUTPUT.PUT_LINE('el departamento '||department_id_user||' no tiene empleados, asi que lo borramos.');
            
            -- ahora borro el departamento específico:
            
            delete
            from departments_exercise depe
            where depe.department_id = department_id_user;
        
        end if;
    
    else
    
        DBMS_OUTPUT.PUT_LINE('error, el departamento introducido NO existe');

    end if;

END;
