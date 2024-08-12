--SELECT: Recupera datos de una o varias tablas.

/*selecciona todas las columnas de las siguientes tablas:
actor, address, customer, film, payment, rental
para realizar un análisis exploratorio*/
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM rental;
SELECT * FROM payment;
--selecciona la columna: first_name de la tabla: actor
select first_name from actor;
--selecciona las columnas: first_name y last_name de la tabla:actor
select first_name, last_name from actor;
--selecciona la columna: district de la tabla: address
select district from address;
--selecciona las columnas: first_name, last_name y email de la tabla: customer

select first_name, last_name, email from customer;
--LIMIT: Restringe la cantidad de filas que se devuelven en una consulta.

--realiza la consulta anterior, limitando a 100 registros 
select first_name, last_name, email from customer limit 100;

--ORDER BY: Ordena los resultados, ya sea de forma ascendente o descendente.
select first_name, last_name 
from actor
order by first_name;
/*selecciona las columnas: first_name y last_name de la tabla: actor + ordénala de forma ascendente
con base en la columna: first_name*/
select first_name, last_name 
from actor
order by first_name; 

--realiza la consulta anterior,y ahora ordénala de forma descendente
select first_name, last_name 
from actor
order by first_name desc; 

/*realiza la consulta anterior, ahora ordenando por las dos columnas: 
first_name de forma ascendente y last_name de forma descendente*/

select first_name, last_name 
from actor
order by first_name asc, last_name desc; 

--DISTINCT: Devuelve solo los valores únicos.

--selecciona los valores únicos de la columna: first_name de la tabla:actor
select distinct first_name 
from actor;


--selecciona los valores únicos de la columna: rating de la tabla:film
select distinct rating
from film; 

--selecciona los valores únicos de la columna: rental_duration de la tabla:film
select distinct rental_duration
from film;

/*selecciona las combinaciones únicas de las columnas: rating y rental_duration 
de la tabla: film*/
select distinct rating,rental_duration
from film;


/*selecciona los valores únicos de la columna: amount, de la tabla: payment,
+ordénala de forma descendente con base en la columna:amount,
+limita a 1 registro para conocer la cantidad más alta de esa columna*/
select distinct amount
from payment
order by amount desc
limit 1;

--COUNT: Cuenta el número de filas en un conjunto de resultados.

--selecciona el recuento de registros de la tabla: actor
select count (*)
from actor; 
--selecciona el recuento de registros de la columna: first_name de la tabla: actor
select count (first_name)
from actor;

--selecciona el recuento de valores únicos de la columna: first_name de la tabla: actor
select count (distinct first_name)
from actor;

--AS: Asigna alias a una columna o tabla.
--Realiza la consulta anterior, dándole un alias a la columna resultante= nombres_unicos o "nombres unicos"
select count (distinct first_name) as nombres_unicos
from actor;

--A RESOLVER.
/*1) ¿Cuántos valores únicos hay en la columna: district de la tabla: address?*/
select distinct district
from address; 

/* respuesta: 378 valores unicos*/

/*2) ¿Cuál es el primer registro de la columna: rental_date de la tabla:rental?,
esto para saber cuándo se rentó la primera pelicula*/
select rental_date 
from rental
order by rental_date asc	
limit 1;


/*3) ¿Cuántos valores únicos tiene la columna: title de la tabla:film?,
agrega un alias a la columna resultante: "recuento de peliculas unicas"
esto para saber cuántas peliculas diferentes tenemos*/
select count (distinct title) as "recuento de peliculas unicas"
from film;



