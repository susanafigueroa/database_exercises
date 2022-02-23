 -- ejercicio1: insertar el siguiente pokemon en la BBDD mediante un bloque anónimo.
 
select * from pok_pokemon;

-- inserto el #155 Cyndaquil -> insert into pok_pokemon (numero_pokedex, nombre, peso, altura) values (155, Cyndaquil, 7.9, 0.5);

set serveroutput on;

DECLARE

numero_pok_pokemon_cyndaquil pok_pokemon.numero_pokedex%TYPE := 155;

nombre_pok_pokemon_cyndaquil pok_pokemon.nombre%TYPE := 'Cyndaquil';

peso_pok_pokemon_cyndaquil pok_pokemon.peso%TYPE := 7.9;

altura_pok_pokemon_cyndaquil pok_pokemon.altura%TYPE := 0.5;

BEGIN

insert into pok_pokemon (numero_pokedex, nombre, peso, altura) values (numero_pok_pokemon_cyndaquil, nombre_pok_pokemon_cyndaquil, peso_pok_pokemon_cyndaquil, altura_pok_pokemon_cyndaquil);

END;
