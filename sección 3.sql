SELECT * FROM payment;

--SUM: Calcula la suma de los valores en una columna.

--selecciona la suma de la columna: amount de la tabla:payment
select sum (amount)
from payment;

--AVG: Calcula el promedio de los valores en una columna.


--selecciona el promedio de la columna: amount de la tabla:payment. Redondealo a dos decimales. 
select round(avg(amount),2)
from payment; 
--MIN: Devuelve el valor mínimo en una columna.

--selecciona el valor mínimo de la columna: amount de la tabla:payment
select min (amount)
from payment;

--MAX: Devuelve el valor máximo en una columna.
--selecciona el valor máximo de la columna: amount de la tabla:payment
select max (amount)
from payment;

/*selecciona en una misma consulta: la suma, el promedio redondeado, el valor mínimo y el valor máximo 
de la columna: amount de la tabla: payment. Asigna un alias a cada columna devuelta*/
select sum(amount) as sumatotal,
round (avg(amount),2) as promedio,
min (amount) as minimo,
max (amount) as maximo
from payment;
	
--GROUP BY: Agrupa filas que tienen los mismos valores.

--selecciona la columna:customer_id y la suma de la columna: amount de la tabla:payment y agrupala por cliente (columna:customer_id) 
select customer_id,
sum (amount)
from payment
group by customer_id
order by 2 desc
limit 3;

/*selecciona columna:payment_date y el promedio redondeado a 1 decimal de la columna: amount de la tabla:payment, 
agrupala por fecha (columna:payment_date), y ordena los resultados por fecha de forma descendente*/
select date(payment_date), round(avg(amount),1)
from payment
group by 1
order by 1 desc;

/*selecciona la columna: customer_id y la suma de la columna: amount de la tabla:payment, 
agrupala por cliente (columna:customer_id) y por fecha (columna:payment_date),
y ordena los resultados por fecha de forma ascendente*/
select customer_id, sum (amount), date(payment_date)
from payment
group by 1,3
order by 1 asc;
/*selecciona la columna:staff_id, la suma y la cuenta de la columna: amount de la tabla: payment,
agrupa por staff (columna:staff_id). Filtra con WHERE para excluir los pagos igual a 0. 
¿Cuál staff completó más pagos?*/
select staff_id, sum(amount), count(amount)
from payment
where amount !=0
group by 1;

--HAVING: Se utiliza junto con GROUP BY para filtrar resultados de agregación basados en una condición.

/*realiza la consulta anterior, agregando un filtro con HAVING para solo incluir el registros donde
el resultado de la cuenta de la columna: amount es mayor a 8000*/
select staff_id, sum(amount), count(amount)
from payment
where amount !=0
group by staff_id
having count(amount)>8000;
/*selecciona la columna:customer_id y la cuenta de la columna: rental_id de la tabla: payment,
agrupa por cliente (columna:customer_id). Filtra con HVAING para solo incluir los resgistros
donde el resultado de la cuenta de la columna: rental_id es mayor o igual a 41
¿Cuáles son los 3 clientes que más peliculas han rentado?*/
select customer_id, count (rental_id)
from payment
group by 1
having count (2) >=41
order by (2) desc
limit 3;

--A RESOLVER.
/*1) ¿Cuál es la suma, el promedio, el valor minimo y el valor maximo de remplazar las peliculas de nuestra 
base de datos? columna: replacement_cost de la tabla: film*/
select sum (replacement_cost), 
avg (1),
min (1),
max (1)
from film;

/*2) ¿Cuántas peliculas tenemos en nuestra base de datos agrupadas por rating?
(columnas: rating y release_year de la tabla:film)*/
select count (film_id),rating
from film
group by rating;

/*3) Realiza una consulta incluyendo HAVING, que responda a una pregunta creada por ti
(puedes incluir cualquier columna y cualquier tabla de la base de datos)*/
select count (film_id),rating
from film
group by rating
having count (film_id)>200;




