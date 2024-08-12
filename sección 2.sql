--WHERE: Filtra los resultados basándose en una condición específica.

--WHERE + OPERADORES (=, >, <, >=, <=, !=, IS NULL, IS NOT NULL)

--selecciona los registros de la tabla: payment, donde la columna: amount sea igual a 0 
select * from payment
where amount=0;

--selecciona los registros de la tabla: payment, donde la columna: amount NO sea igual a 0 
select * from payment
where amount !=0;
/*selecciona los registros de la tabla: payment, donde la columna: amount sea mayor a 10, 
y ordenalos de manera ascendente con base en la columna: amount*/
select * from payment
where amount >=10
order by amount asc;


/*selecciona los registros de la tabla: payment, donde la columna: amount sea igual o menor a 5
y ordenalos de manera descendente con base en la columna: amount*/
select * from payment
where amount <=5
order by amount desc;
--selecciona los registros de la tabla: rental, donde el valor de la columna: return_date sea nulo
select * from rental 
where return_date is null;
--selecciona los registros de la tabla: rental, donde el valor de la columna: return_date NO sea nulo
select * from rental 
where return_date is not null;
--selecciona la columna: last_name de la tabla: actor, donde la columna: first_name sea igual a 'BOB'
select last_name, last_name
from actor 
where first_name='BOB'

--WHERE + CONDICIONALES (AND, OR)

/*selecciona los registros de la tabla: payment, donde la columna: amount sea menor a 3 
O mayor a 9*/
select * from payment
where amount <3 or amount >9;

/*selecciona los registros de la tabla: payment, donde la columna: amount sea igual a 0.99
Y la columna customer_id sea igual a 147*/
select * from payment
where amount =0.99 and customer_id =147;
--WHERE + RANGOS (BETWEEN)

/*selecciona los registros de la tabla: payment, donde la columna: payment_date
esté dentro del rango: '2020-01-21' a '2020-01-31'*/
select * from payment 
where payment_date between '2020-01-21' and '2020-01-31';

/*selecciona el recuento de los registros de la tabla: payment, 
donde la columna: payment_date esté dentro del rango: '2020-01-21' a '2020-01-31',
y la columna: amount esté dentro del rango 1.99 a 3.99*/
select * from payment 
where payment_date between '2020-01-21' and '2020-01-31' 
and amount between 1.99 and 3.99;

--WHERE + CONJUNTOS/LISTAS (IN, NOT IN)

/*selecciona los registros de la tabla: payment, 
donde la columna customer_id sea igual a uno de estos valores: 215, 431, 245, 127*/
select * from payment
where customer_id in (215,431,245,127);
/*selecciona los registros de la tabla: payment, 
donde la columna customer_id NO sea igual a uno de estos valores: 215, 431, 245, 127*/
select * from payment
where customer_id not in (215,431,245,127);

/*selecciona los registros de la tabla: customer, 
donde la columna first_name sea igual a uno de estos valores: 'CAROL', 'AMY', 'ANNA'*/
select * from customer
where first_name in('CAROL', 'AMY', 'ANNA');
/*selecciona los registros de la tabla: customer, 
donde la columna store_id NO sea igual a uno de estos valores: 1,2 */
select * from customer
where store_id not in(1,2);

--WHERE + PATRONES/COMODINES (LIKE/NOT LIKE)
SELECT * FROM actor 
WHERE first_name LIKE 'A%';

SELECT * FROM actor 
WHERE first_name ILIKE 'a%'

SELECT * FROM actor 
WHERE first_name NOT LIKE 'A%';

SELECT * FROM actor 
WHERE first_name LIKE '__A%'

/*selecciona los registros de la tabla: film donde la columna: description lleve la palabra 'Epic'
y la columna: title empiece con la letra 'C'*/
select * from film 
where description like '%Epic%'
and title like 'C%';

/*selecciona los registros de la tabla: film donde la columna: description lleve la palabra 'Drama'
y la columna: title tenga por segundo carácter la letra 'U'*/
select * from film
where description like '%Drama%'
and title like '_U%';
/*selecciona los registros de la tabla: film donde la columna: description NO lleve la palabra 'Story'
y la columna: title tenga por último carácter la letra 'Y'*/
select * from film
where description not like '%Story%'
and title like '%Y';

--A RESOLVER.
/*1) ¿Cuáles son los titulos de las peliculas de la tabla: film 
donde el film_id es igual a 254 y 524?*/
select * from film 
where film_id in (254,524);
/*"DRIVER ANNIE"
"LION UNCUT"*/

/*2) ¿Cuántos clientes NO pertenecen a la tienda 1 (columna:store_id) 
de la tabla: customer?*/
select *from customer 
where store_id !=1;
/* 273 */

/*3) ¿Cuántos pagos hay en la tabla: payment donde el monto (columna:amount) sea mayor o igual a 5.99
y hayan sucedido en el rango de fecha '2020-01-25' a '2020-01-27' (columna:payment_date)?*/
select * from payment 
where amount >=5.99 
and payment_date between'2020-01-25'and'2020-01-27';
/* 83 */
/*4) ¿Cuántas peliculas contienen la palabra 'Saga' en su descripción (columna:description)
y un titulo (columna: title)) que empiece por la letra 'A' o la letra 'R'? en la tabla: film*/
select * from film
where description like '%Saga%'
and title like 'A%' or title like'R%';
/* 49 */
/*5) ¿Cuáles actores tienen un nombre (columna:first_name) que empiece con la letra 'W' 
y un apellido(columna:last_name) que termine con la letra 'N' en la tabla: actor*/
Select * from actor
where first_name like 'W%'
and last_name like '%N';
/* 
"WOODY"	"HOFFMAN"
"WALTER"	"TORN"
"WARREN"	"JACKMAN"
"WILL"	"WILSON"
"WILLIAM"	"HACKMAN"*/



