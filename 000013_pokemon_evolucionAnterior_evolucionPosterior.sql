-- 000013 _ Pedir al usuario un número de la pokedex.
-- Comprobar que este número existe.
-- Mirar si este pokemon evoluciona o viene de alguna evolución.
-- Mostrar el siguiente mensaje por consola (Ejemplos)
-- El pokemon Charmander no tiene evolución previa y evoluciona a Charmeleon.//numero_pokedex = 4
-- El pokemon Zapdos no tiene evolucion previa ni posterior.
-- El pokemon Ivisaur (2) origen(1): Bulbasaur y evolucionado(3) en Venusaur.
-- El pokemon Charizard evoluciona de Charmeleon y ya no evoluciona más.

-- buscar si el pp.numero_pokedex se encuentra en la tabla:

select pp.numero_pokedex
from pok_pokemon pp
where pp.numero_pokedex = 4;


-- busco el nombre del pokemon introducido

Select pp.nombre
from pok_pokemon pp
where pp.numero_pokedex = 4;

-- hago el select para encontrar el pokemon evolucionado
-- yo sé que pok_pokemon.numero_pokedex = pok_evoluciona_de.pokemon_origen
-- por lo tanto voy a buscar el evolucionado 

Select pokev.pokemon_evolucionado
from pok_evoluciona_de pokev
inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen 
where pp.numero_pokedex = 4;

-- busco el nombre del pokemon evolucionado

Select pp.nombre
from pok_pokemon pp
where pp.numero_pokedex = (
    Select pokev.pokemon_evolucionado
    from pok_evoluciona_de pokev
    inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen
    where pp.numero_pokedex = 4);



-- ahora tengo que mirar si el pokemon tiene evolución previa
-- por lo tanto el pp.numero_pokedex pasará a ser el evolucionado

Select pp.nombre
from pok_pokemon pp
where pp.numero_pokedex = (
    Select pokev.pokemon_origen
    from pok_evoluciona_de pokev
    inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_evolucionado
    where pp.numero_pokedex = 4);



SET SERVEROUTPUT ON;

DECLARE

    numPokeminchins pok_pokemon.numero_pokedex%TYPE;
    
    nombre pok_pokemon.nombre%TYPE;
    
    nomPokeminchinsEvolucionado pok_pokemon.nombre%TYPE;
    
    nomPokeminchinsAnteriorEvolucion pok_pokemon.nombre%TYPE;
    
    existe number(1);
    
    existe2 number(1);
        
BEGIN

    numPokeminchins := &numPokeminchins;
    
    Select pp.nombre into nombre from pok_pokemon pp where pp.numero_pokedex = numPokeminchins;
    
    Select count(pokev.pokemon_evolucionado) into existe from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen where pp.numero_pokedex = numPokeminchins;
        if (existe = 0) then
        DBMS_OUTPUT.PUT_LINE('No tiene pokemon evolucionado');
        elsif (existe = 1) then
            Select pp.nombre into nomPokeminchinsEvolucionado from pok_pokemon pp where pp.numero_pokedex = ( Select pokev.pokemon_evolucionado from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen where pp.numero_pokedex = numPokeminchins);
            DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' si que tiene pokemon evolucionado y se llama '||nompokeminchinsevolucionado);
        end if;
        
    Select count(pokev.pokemon_origen) into existe2 from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_evolucionado where pp.numero_pokedex = numPokeminchins;
        if (existe2 = 0) then
        DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' no tiene pokemon anterior');
        elsif (existe2 = 1) then
            Select pp.nombre into nomPokeminchinsAnteriorEvolucion from pok_pokemon pp where pp.numero_pokedex = ( Select pokev.pokemon_origen from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_evolucionado where pp.numero_pokedex = numPokeminchins);
        DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' si que tiene pokemon anterior y se llama '||nomPokeminchinsAnteriorEvolucion);
        end if;
    
END;
