--CASE WHEN: Evalúa condiciones y devuelve valores específicos basados en el resultado de esas condiciones. 
SELECT * FROM FILM 

/*crear categorias para las distinas peliculas(tabla:film) con base en su tarifa de renta (columna:rental_rate), 
donde:
-rental_rate= 0.99 es barata
-rental_rate = 2.99 es media
-rental_rate = 4.99 es cara
*/

select title, rental_rate, rental_duration, 
case
when rental_rate=0.99 then 'barata'
when rental_rate=2.99 then 'media'
when rental_rate=4.99 then 'cara'
else 'sin_tarifa'

end as "tarifa"

from film;


/*crear categorias para las distinas peliculas(tabla:film) con base en su tarifa de renta (columna:rental_rate) y
su duración de renta (columna: rental_duration) 
donde:
-rental_rate= 0.99 y rental_duration entre 3 y 5 es barata_corta
-rental_rate= 0.99 y rental_duration entre 6 y 7 es barata_larga
-rental_rate = 2.99  y rental_duration entre 3 y 5 es media_corta
-rental_rate = 2.99  y rental_duration entre 6 y 7  es media_larga
-rental_rate = 4.99 y rental_duration entre 3 y 5 es cara_corta 
-rental_rate = 4.99 y rental_duration entre 6 y 7  es cara_larga
*/
select title, rental_rate, rental_duration, 
case
when rental_rate= 0.99 and rental_duration between 3 and 5 then 'barata_corta'
when rental_rate= 0.99 and rental_duration between 6 and 7 then 'barata_larga'
when rental_rate= 2.99 and rental_duration between 3 and 5 then 'media_corta'
when rental_rate= 2.99 and rental_duration between 6 and 7 then 'media_larga'
when rental_rate= 4.99 and rental_duration between 3 and 5 then 'cara_corta'
when rental_rate= 4.99 and rental_duration between 6 and 7 then 'cara_larga'
else 'sin_categoria'

end as "categoria por precio y duracion"

from film;

--A RESOLVER. 
/*1) Crea categorias para las peliculas con base en su descripcion (columna:description), 
donde:
-si incluye la palabra 'Drama' en cualquier posición de la descripción es 'drama'
-si incluye la palabra 'Documentary' en cualquier posición de la descripción es 'documental'
-si incluye la palabra 'Saga' en cualquier posición de la descripción es una 'saga'
-si incluye la palabra 'Story' en cualquier posición de la descripción es una 'historia'
-si no incluye ninguno de estos valores, entonces es 'otra'
Nombra a esta nueva columna: "categoria con base a la descripcion" */
select title, description,
case
when description like '%Drama%' then 'Drama'
when description like '%documentary%' then 'Documental'
when description like '%saga%' then 'Saga'
when description like '%Story%' then 'Story'
else 'Otra'
end as "categoria con base a la descripcion"
from film;

--con valores nulos 
SELECT title, description,
CASE
	WHEN description LIKE '%Drama%' THEN 'drama'
	WHEN description LIKE '%Documentary%' THEN 'documental'
	WHEN description LIKE '%Saga%' THEN 'saga'
	WHEN description LIKE '%Story' THEN 'story'
--ELSE 'otra'
END AS "categoria con base a la descripcion"
FROM film;
