-- HACER QUE SE INCREMENTE EN 1 EL IDPROD:

-- creo una tabla duplicada de producto que se llamara duplicacion producto
-- create table duplicacion_producto AS SELECT * FROM producto;

-- inserta valores en la tabla duplicacion_producto:
-- ejemplo1: descripcion descripcionProducto1 10000.55

-- insert into duplicacion_producto (DESCRIPCION, PRECIO)
-- values ('descripcionProducto1', 10000);

-- como me he equivocado al introducir datos, borro los datos:
-- delete from duplicacion_producto where descripcion = 'descripcionProducto1';

-- vuelvo a hacer el insert con default: -> FUNCIONARIA SI FUESE AUTOINCREMENT
-- insert into duplicacion_producto (IDPROD, DESCRIPCION, PRECIO)
-- values (default, 'descripcionProducto1', 10000);

-- como me he equivocado al introducir datos, borro los datos:
-- delete from duplicacion_producto where descripcion = 'descripcionProducto1';

-- vuelvo a hacer el insert con default:
-- insert into duplicacion_producto (IDPROD, DESCRIPCION, PRECIO)
-- values (1, 'descripcionProducto1', 10000);

-- ahora hago un for para que se incremente el idprod:
-- la query para obtener el ultimo id de IDPROD:

/*select dp.idprod into idAnterior
from duplicacion_producto dp
order by dp.idprod
desc FETCH FIRST 1 ROWS ONLY;*/

-- insert into duplicacion_producto (IDPROD, DESCRIPCION, PRECIO)
-- values ( (idAnterior + 1), 'descripcionProducto2', 20000);

-- compruevo que se ha insertado correctamente:
-- select * from duplicacion_producto;

SET SERVEROUTPUT ON;

DECLARE

    idAnterior producto.idprod%TYPE;
    
    idActual producto.idprod%TYPE;

BEGIN

    -- busco el idAnterior:
    select dp.idprod into idAnterior
    from duplicacion_producto dp
    order by dp.idprod
    desc FETCH FIRST 1 ROWS ONLY;    
    
    DBMS_OUTPUT.PUT_LINE('el idAnterior es '||idAnterior);  
    
    idActual := idAnterior + 1;
    
    DBMS_OUTPUT.PUT_LINE('el idActual es '||idActual);  
    
    insert into duplicacion_producto (IDPROD, DESCRIPCION, PRECIO)
    values ( idActual, 'descripcionProducto3', 30000);
    
END;
