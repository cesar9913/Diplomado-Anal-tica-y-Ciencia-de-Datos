--CREATE TABLE: Crea una nueva tabla en la base de datos.

/*Crear una tabla llamada productos, con las siguientes columnas:
1.- id (almacenará numeros enteros, no debe tener valores nulos)
2.- nombre (almacenará cadenas de carácteres, con un máximo de 35 carácteres)
3.- cantidad_inventario (almacenará numeros enteros)
4.- precio_unitario (almacenará numeros decimales)
*/
create table productos (
id int not null,
nombre varchar (35),
cantidad_inventario int,
precio_unitario decimal);
select * from productos;
--Confirma si tu tabla se creó, para esto hay dos opciones: checar desde schemas>tables o utilizando la cláusula SELECT * 


--INSERT INTO/VALUES: Permiten añadir nuevos registros a una tabla.

/*Inserta los siguientes registros con sus valores correspondientes a la tabla productos:
1, 'leche', 15, 25.50
2, 'pan', 3, 15.00
3, 'bloqueador', 10, 155.00
4, 'labial', 7, 89.90
5, 'libreta', 27, 70.70
6, 'cereal', 10, 35.50
7, 'detergente', 8, 88.50 
8, 'jugo', 2, 23.50
9, 'crema corporal', 6, 99.99
(10,	'tortillas de harina', 5, 45.00)
*/
insert into productos(id,nombre, cantidad_inventario, precio_unitario)
	values (1, 'leche', 15, 25.50),
(2, 'pan', 3, 15.00), 
(3, 'bloqueador', 10, 155.00),
(4, 'labial', 7, 89.90),
(5, 'libreta', 27, 70.70),
(6, 'cereal', 10, 35.50),
(7, 'detergente', 8, 88.50 ),
(8, 'jugo', 2, 23.50),
(9, 'crema corporal', 6, 99.99),
(10,	'tortillas de harina', 5, 45.00);

/*Crear una tabla llamada clientes, con las siguientes columnas:
1.- id (será la clave primaria, y se deberá incrementar automáticamente al insertar registros)
2.- primer_nombre (almacenará cadenas de carácteres, con un máximo de 50 carácteres)
3.- apellido (almacenará cadenas de carácteres, con un máximo de 50 carácteres)
4.- fecha_nacimiento (almacenará fechas)
5.- ciudad (almacenará cadenas de carácteres, con un máximo de 20 carácteres)
6.- estado (almacenará cadenas de carácteres, específicamente 3 carácteres)
7.- codigo_postal (almacenará números enteros)
*/
create table clientes (
id serial primary key,
primer_nombre varchar (50),
apellido varchar (50),
fecha_nacimiento date,
ciudad varchar (20),
estado varchar(3),
codigo_postal int)

--Confirma si tu tabla se creó
select * from clientes;
--Inserta los siguientes registros a la tabla 
INSERT INTO clientes (primer_nombre, apellido, fecha_nacimiento, ciudad, estado, codigo_postal)
VALUES ('Ana', 'Perez', '1999-09-22', 'Colima', 'COL', 28979),
('Juan', 'Garcia', '1988-03-15', 'Guadalajara', 'JAL', 44100),
('Maria', 'Lopez', '1995-07-30', 'Monterrey', 'NLE', 64000),
('Luis', 'Martinez', '2000-12-12', 'Cancun', 'ROO', 77500),
('Karla', 'Gonzalez', '1992-04-08', 'Puebla', 'PUE', 72000),
('Jorge', 'Perez', '1985-05-25', 'Tijuana', 'BCN', 22000),
('Sofia', 'Rodriguez', '1997-10-18', 'Merida', 'YUC', 97000),
('Miguel', 'Sanchez', '1990-02-22', 'Toluca', 'MEX', 50000),
('Lucia', 'Ramirez', '1993-11-11', 'Morelia', 'MIC', 58000),
('Carlos', 'Torres', '1989-06-06', 'Veracruz', 'VER', 91700),
('Fernanda', 'Flores', '2001-01-01', 'Leon', 'GUA', 37000),
('Oscar', 'Rivera', '1996-03-20', 'Saltillo', 'COA', 25000),
('Adriana', 'Cruz', '1987-09-10', 'Oaxaca', 'OAX', 68000),
('Ricardo', 'Ortiz', '1996-12-24', 'Aguascalientes', 'AGS', 20000),
('Alejandra', 'Morales', '1991-08-05', 'Queretaro', 'QRO', 76000),
('Raul', 'Reyes', '1998-02-14', 'Culiacan', 'SIN', 80000),
('Valeria', 'Gutierrez', '1999-11-30', 'Hermosillo', 'SON', 83000),
('Francisco', 'Chavez', '1986-04-17', 'Tepic', 'NAY', 63000),
('Paola', 'Vargas', '2002-05-22', 'Zacatecas', 'ZAC', 98000),
('Armando', 'Ramos', '1995-07-07', 'Villahermosa', 'TAB', 86000
'Cesar', 'Hernandez', '1999-07-23', 'Colima', 'COL', 28800	);

--Inserta un nuevo registro con tu información personal 
INSERT INTO clientes (primer_nombre, apellido, fecha_nacimiento, ciudad, estado, codigo_postal)
VALUES ('Cesar', 'Hernandez', '1999-07-23', 'Colima', 'COL', 28800	);

--UPDDATE/SET: Modifican registros existentes en una tabla.

--Modifica el registro de Juan. Cambia su valor en el primer_nombre a 'Manuel'.
update clientes
set primer_nombre='Manuel'
where primer_nombre='Juan'
--Modifica el registro de Armando. Cambia su valor en el apellido a 'Hernandez'.
update cliente
set apellido='Hernandez'
where primer_nombre= 'armando' 

select * from clientes;
--Modifica el registro con id 1. Cambia su su valor en la ciudad a 'Chihuahua' y en el estado a 'CHH'.
update clientes
set ciudad='Chihuahua', estado='CHH'
where id=1

--Confirma que tus 3 registros se modificaron 
select * from clientes;

--DELETE: Elimina registros existentes en una tabla.

--Elimina el registro con ciudad='Cancun' 
delete from clientes
where ciudad='Cancun'
--Elimina el registros donde la fecha de nacimiento sea '1996-12-24'
delete from clientes
where fecha_nacimiento='1996-12-24'


--A RESOLVER.
--Crea una tabla con 5 columnas, utilizando al menos 3 tipos de datos distintos.
create table elementos(
nombre varchar (50),
simbolo_químico char (5),
numero_atómico int,
masa_atómica decimal,
estado_natural varchar(50));
--Inserta 8 registros en la tabla. 
insert into elementos (nombre, simbolo_químico, numero_atómico,masa_atómica,estado_natural)
values ('hierro','Fe',26,55.84,'solido'),
('cobalto','Co',27,58.93,'solido'),
('manganeso','Mn',25,54.93,'solido'),
('boro','B',5,10.81,'liquido'),
('carbono','C',6,12.01,'solido'),
('cobre','Cu',29,63.54,'solido'),
('plata','Ag',47,107.87,'solido'),
('mercurio','Hg',80,200.59,'liquido');

select * from elementos;
--Modifica 2 registros.
update elementos
set nombre='hierro'
where estado_natural= 'liquido' 

update elementos
set nombre='carbono'
where numero_atómico= 9 

--Elimina 1 registro, para que en total queden solamente 7 registros. 
delete from elementos
where nombre='hierro'

