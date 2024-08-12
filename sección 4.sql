--LENGTH: Calcula la longitud (número de caracteres) de una cadena. 
SELECT * FROM customer;
select length (email), email
from customer;
--¿Cuántos carácteres tienen los apellidos (columna:last_name) de los clientes de la tabla:customer?
select length(last_name), last_name 
from customer;

--LOWER: Convierte todos los caracteres de una cadena a minúsculas. 


--Convierte a minusculas los apellidos de los clientes:
select lower(last_name)
from customer;

--INITCAP: Convierte el primer caracter de una cadena a mayúscula. 

--Convierte solo la primera letra del apellido de los clientes a mayúscula. 
select INITCAP(last_name)
from customer;
--UPPER: Convierte todos los caracteres de una cadena a mayúsculas.

--Convierte todos los carácteres del email a mayúsculas (columa: email).
select upper(email)
from customer;
--LEFT: Extrae un número específico de caracteres desde el principio de una cadena.

--extrae solo la primera letra del nombre de los clientes (columna: first_name)
select LEFT(first_name,1)
from customer;

--extrae la segunda letra del nombre de los clientes (columna: first_name)
SELECT LEFT(((first_name),2)1)
FROM customer;
--lo intente con la forma que sugirio pero no funciono.

--RIGHT: Extrae un número específico de caracteres desde el final de una cadena.

--extrae los 18 ultumos valores de la columna:email. 
select right(email,18)
from customer;

SELECT SUBSTRING (email FROM POSITION('@' IN email))
FROM customer;

SELECT SUBSTRING (email FROM POSITION('@' IN email)+1)
FROM customer;

--CONCAT: Combina dos o más cadenas de texto en una sola. 

--Combina las columnas de nombre y apellido en una sola, añade un espacio entre ambos valores. (columnas: first_name, last_name)
select concat (first_name,' ' ,last_name) as nombre_completo
from customer;

/*Combina las columnas de nombre y apellido en una sola, añade un espacio entre ambos valores. 
(columnas: first_name, last_name)*. Convierte la primera letra del nombre y apellido a mayúscula.*/
select concat (initcap (first_name),' ' ,initcap(last_name)) as nombre_completo
from customer;

--A RESOLVER. 
/*1)Selecciona la primera letra de la columna: first_name 
y todos los carácteres del apellido (columna:last_name) convirtiendo este para que solo lleve la primera letra en mayúscula,
y combinalos en una misma columna, separalos por un punto y un espacio. Ej de valor resultante: P. Guinnes*/
select concat (initcap(left (first_name,1)),'. ' ,initcap(last_name)) as nombre_completo
from customer;

/*2) Selecciona el email(columna:email) de los clientes convirtiendo todos sus carácteres a minúsculas asi como la longitud de los mismos,
filtra la consulta para que solo te devuelva los emails que tienen una longitud menor a 30*/
select lower(email), length(email)
from customer
where length <30;

/*Selecciona las 3 primera letras de la columna: last_name y seguido de ellas, añade '***', 
Ej. de valor resultante: JON****/
select concat (left (last_name,3), '***')
from customer;
