-- delete from pok_pokemon where numero_pokedex = 155;

set serveroutput on;

DECLARE

Rareza number(1);--la necessito perque l'usuari ha d'introduir la rareza que vol seleccionar

numero_pok_pokemon_cyndaquil pok_pokemon.numero_pokedex%TYPE := 155;--insert numero_pokedex 155 OK

nombre_pok_pokemon_cyndaquil pok_pokemon.nombre%TYPE := 'Cyndaquil'; -- insert nombre pokemon Cyndaquil OK

peso_pok_pokemon_cyndaquil pok_pokemon.peso%TYPE := 7.9; -- insert weight OK

altura_pok_pokemon_cyndaquil pok_pokemon.altura%TYPE := 0.5; -- insert height OK

ataque_pok_pokemon_cyndaquil pok_tipo.nombre%TYPE := 'Fuego';-- insert type fire OK



HP_Cyndaquil pok_estadisticas_base.ps%TYPE := 39; --OK

ataque_Cyndaquil pok_estadisticas_base.ataque%TYPE := 52; --ataque OK

defensa_Cyndaquil pok_estadisticas_base.defensa%TYPE := 43; -- defensa ok

especial_Cyndaquil pok_estadisticas_base.especial%TYPE := 60; -- especial OK

velocidad_Cyndaquil pok_estadisticas_base.velocidad%TYPE := 65; -- velocidad OK

BEGIN

Rareza := &Rareza;

if Rareza >= 1 or Rareza <= 3 then
    if Rareza = 1 then
        HP_Cyndaquil := HP_Cyndaquil + 4;
        ataque_Cyndaquil := ataque_Cyndaquil +2;
        especial_Cyndaquil := especial_Cyndaquil +1;
    elsif Rareza = 2 then
        HP_Cyndaquil := HP_Cyndaquil-3;
        velocidad_Cyndaquil := velocidad_Cyndaquil + 9;
    elsif Rareza = 3 then
        altura_pok_pokemon_cyndaquil := 1;
        peso_pok_pokemon_cyndaquil := 12;
        ataque_Cyndaquil := ataque_Cyndaquil + 3;
        defensa_Cyndaquil := defensa_Cyndaquil + 3;
        especial_Cyndaquil := especial_Cyndaquil + 3;
        velocidad_Cyndaquil := velocidad_Cyndaquil + 3;
    end if;
    
    -- inserto dins la taula pok_pokemon NUMERO_POKEDEX NOMBRE                PESO     ALTURA
    insert into pok_pokemon (numero_pokedex, nombre, peso, altura)
    values (numero_pok_pokemon_cyndaquil, nombre_pok_pokemon_cyndaquil, peso_pok_pokemon_cyndaquil, altura_pok_pokemon_cyndaquil);
    
    -- inserto dins la taula pok_estadisticas_base NUMERO_POKEDEX         PS     ATAQUE    DEFENSA   ESPECIAL  VELOCIDAD
    insert into pok_estadisticas_base (numero_pokedex, ps, ataque, defensa, especial, velocidad)
    values (numero_pok_pokemon_cyndaquil, HP_Cyndaquil, ataque_Cyndaquil, defensa_Cyndaquil, especial_Cyndaquil, velocidad_Cyndaquil);
    
    -- inserto dins la taula pok_pokemon_movimiento_forma NUMERO_POKEDEX ID_MOVIMIENTO ID_FORMA_APRENDIZAJE
    
    insert into pok_pokemon_movimiento_forma (numero_pokedex, id_movimiento, id_forma_aprendizaje)
    select (select pp.numero_pokedex from pok_pokemon pp where pp.nombre = 'Cyndaquil') as numero, (select pm.id_movimiento from pok_movimiento pm where pm.id_tipo in (
        select pt.id_tipo from pok_tipo pt where nombre = 'Fuego')) as movimiento, (select pfap.id_forma_aprendizaje from pok_forma_aprendizaje pfap where pfap.id_tipo_aprendizaje in(
        select ptfapr.id_tipo_aprendizaje from pok_tipo_forma_aprendizaje ptfapr where ptfapr.tipo_aprendizaje = 'Nivel') and rownum = 1) as aprendizaje from pok_movimiento pm where pm.id_tipo in (
        select pt.id_tipo from pok_tipo pt where nombre = 'Fuego');
    
else
    DBMS_OUTPUT.PUT_LINE('El valor de la rareza no existe');
end if;    

END;


-- busco los id movimiento de los de tipo fuego:
--select pm.id_movimiento from pok_movimiento pm where pm.id_tipo in (
--    select pt.id_tipo from pok_tipo pt where nombre = 'Fuego');
    

-- busco el numero pokedex
--select pp.numero_pokedex from pok_pokemon pp where pp.nombre = 'Cyndaquil'; -- podria posar el 155 directament


-- busco id_forma a partir del nivel

--select pfap.id_forma_aprendizaje from pok_forma_aprendizaje pfap where pfap.id_tipo_aprendizaje in(
--    select ptfapr.id_tipo_aprendizaje from pok_tipo_forma_aprendizaje ptfapr where ptfapr.tipo_aprendizaje = 'Nivel') and rownum = 1;
