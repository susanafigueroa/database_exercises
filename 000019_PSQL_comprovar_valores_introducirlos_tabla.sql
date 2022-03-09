-- EJERCICIO DE CLASE

-- Ejercicios para practicar.
-- create table DEPARTMENTS_EXERCISE AS SELECT * FROM DEPARTMENTS;
-- Pedir al usuario un nombre de departamento, si ese departamento no tiene empleados, borrar el departamento.

/* Mediante PLSQL, pedir al usuario la información necesaria para crear un job, siempre y cuando no exista.
   Una vez se crea el trabajo todo OK. Introducir un Becario (nuevo JOB) llamado John Wick, con correo jwick@god.es
   con fecha de contratación del día anterior y salaro de 500k
*/

-- 1 _ siempre y cuando no tenga empleados el departamento borrarlo

-- 2 _ plsql donde le pedimos al usuario la informacion necesaria para crear un job -> JOB_ID y JOB_TITLE -> comprovar que el salario no sea negativo
-- 3 _`plsql donde introducimos un becario -> lo introduce el usuario 

-- create table DEPARTMENTS_EXERCISE AS SELECT * FROM DEPARTMENTS;

select * from jobs;

-- los datos que necesito que me de el usuario para crear el job son:
-- JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY

-- query para saber si existe el job_id_user o no:

    select count(j.job_id)
    from jobs j
    where j.job_id = 'ST_MAN';

-- query para saber si existe el job_title_user o no:

    select count(j.job_title)
    from jobs j
    where j.job_title = 'Stock Manager';

-- RESPUESTA:

SET SERVEROUTPUT ON;

DECLARE

    -- introducir el job_id para el nuevo job
    job_id_user jobs.job_id%TYPE := '&job_id_user';
    
    -- comprovar si existe el job_id_user 
    existe_job_id_user number(1);
    
    -- introducir el job_title para el nuevo job
    job_title_user jobs.job_title%TYPE := '&job_title_user';
    
    -- comprovar si existe el job_title_user:
    existe_job_title_user number(1);
    
    -- introducir el salario minimo para el nuevo job
    min_salary_user jobs.min_salary%TYPE := &min_salary_user;
    
    -- introducir el salario maximo apra el nuevo job
    max_salary_user jobs.max_salary%TYPE := &max_salary_user;

BEGIN

-- compruevo si existe el job_id_user dentro de los job_id:

    select count(j.job_id) into existe_job_id_user
    from jobs j
    where j.job_id = job_id_user;
    
    if existe_job_id_user = 1 then
        
        DBMS_OUTPUT.PUT_LINE('ERROR, el id del job introducido ya existe');
        
    else
    
        DBMS_OUTPUT.PUT_LINE('OK, el id del job introducido NO existe');
        
        -- compruevo si existe el job_title_user dentro de los job_title:

        select count(j.job_title) into existe_job_title_user
        from jobs j
        where j.job_title = job_title_user;
    
        if existe_job_title_user = 1 then
            
            DBMS_OUTPUT.PUT_LINE('ERROR, el titulo del job introducido ya existe');
        
        else
        
            DBMS_OUTPUT.PUT_LINE('ok, el titulo del job introducido NO existe');

            if min_salary_user < 0 then
    
                DBMS_OUTPUT.PUT_LINE('ERROR, el salario minimo no puede ser negativo');
            
            else
            
                DBMS_OUTPUT.PUT_LINE('OK, el salario minimo NO ES NEGATIVO');
            
                if max_salary_user < 0 then
    
                    DBMS_OUTPUT.PUT_LINE('ERROR, el salario maximo no puede ser negativo');
                
                else
                
                    DBMS_OUTPUT.PUT_LINE('ok, el salario maximo NO ES NEGATIVO');
                    
                    -- a partir de aqui se han cumplido todas las condiciones
                    -- adecuadamente, asi que procedo a insertar los datos
                    -- del nuevo job
                    
                    DBMS_OUTPUT.PUT_LINE('todos los valores introducidos son correctos, introducimos los valores');
                    
                    insert into jobs (job_id, job_title, min_salary, max_salary)
                    values (job_id_user, job_title_user, min_salary_user, max_salary_user);   
    
                end if;
            
            end if;
    
        end if;
    
    end if;
    
END;
