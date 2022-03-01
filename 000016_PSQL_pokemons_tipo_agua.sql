-- que muestre los pokemons tipo agua dentro de un rango añadido por el usuario


SET SERVEROUTPUT ON;

DECLARE
  
    nombre pok_pokemon.nombre%TYPE;
    
    nomPokeminchinsEvolucionado pok_pokemon.nombre%TYPE;
    
    nomPokeminchinsAnteriorEvolucion pok_pokemon.nombre%TYPE;
    
    existe number(1);
    
    existe2 number(1);
    
    existe3 number(1);
    
    minimo number(3);
    
    maximo number(3);
        
BEGIN

    for i in &minimo .. &maximo loop      
    
        Select count(*) into existe3 from pok_pokemon pok
            inner join pok_pokemon_tipo ptip on ptip.numero_pokedex = pok.numero_pokedex
            inner join pok_tipo tipo on tipo.id_tipo = ptip.id_tipo and tipo.nombre='Agua'
            where pok.numero_pokedex = i;
    
            if existe3 != 0 then
            
                Select pp.nombre into nombre from pok_pokemon pp where pp.numero_pokedex = i;
                
                Select count(pokev.pokemon_evolucionado) into existe from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen where pp.numero_pokedex = i;
                    if (existe = 0) then
                    DBMS_OUTPUT.PUT_LINE('No tiene pokemon evolucionado');
                    elsif (existe = 1) then
                        Select pp.nombre into nomPokeminchinsEvolucionado from pok_pokemon pp where pp.numero_pokedex = ( Select pokev.pokemon_evolucionado from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_origen where pp.numero_pokedex = i);
                        DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' si que tiene pokemon evolucionado y se llama '||nompokeminchinsevolucionado);
                    end if;
                    
                Select count(pokev.pokemon_origen) into existe2 from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_evolucionado where pp.numero_pokedex = i;
                    if (existe2 = 0) then
                    DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' no tiene pokemon anterior');
                    elsif (existe2 = 1) then
                        Select pp.nombre into nomPokeminchinsAnteriorEvolucion from pok_pokemon pp where pp.numero_pokedex = ( Select pokev.pokemon_origen from pok_evoluciona_de pokev inner join pok_pokemon pp on pp.numero_pokedex = pokev.pokemon_evolucionado where pp.numero_pokedex = i);
                    DBMS_OUTPUT.PUT_LINE('El pokemon '||nombre||' si que tiene pokemon anterior y se llama '||nomPokeminchinsAnteriorEvolucion);
                    end if;
            end if;            
    end loop;
    
END;
