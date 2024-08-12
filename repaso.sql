--1)¿Cuántos lenguajes únicos existen para las peliculas de nuestra base de datos? (pista: utiliza la cláusula DISTINCT)
select distinct language_id
from film;


--2)¿Cuántas peliculas de nuestra base de datos NO fueron lanzadas en el año 2006?
select count (film_id)
from film
where release_year!=2006


--3)¿Cuál sería el costo total de remplazar todas las peliculas de nuestra base de datos?
select * from film;
select sum(replacement_cost)
from film;
--4)¿Cuál es el costo promedio de tarifa de renta para las peliculas de nuestra base de datos?
select round(avg(rental_rate),2)
from film;
--5)¿Cuál es la descripción de la pelicula que lleva por título 'ANGELS LIFE'?
select description 
from film
where title ilike 'ANGELS LIFE'
--6)¿Cuántas peliculas existen pertenecientes al rating 'PG'? 
select count (film_id)
from film 
where rating='PG'
--7)¿Cuáles son los titulos de las peliculas que llevan por id: 14, 91 y 113?
select film_id, title 
from film
where film_id in (14,91,113)

--8)¿Cuántas peliculas hay con el máximo costo de remplazo en nuestra base de datos? (pista: utiliza una subconsulta) 
select count(*)
from film
where replacement_cost= (select max(replacement_cost)from film)

--9)¿Cuántas peliculas incluyen la palabra 'Mexico' al final de su descripción? (pista: utiliza la cláusula LIKE)?
select * from film
where description like '%Mexico%'

--10)Agrupa las peliculas por su tarifa de renta. ¿Cuál tarifa de renta es la más repetida en nuestra base de datos? 0.99
 select count (film_id), rental_rate
from film
group by rental_rate 
order by count(film_id)desc 
limit 1