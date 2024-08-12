-- Crear tabla para players.csv llamada players
CREATE TABLE players (
  id INT,
  player VARCHAR,
  height INT,
  weight INT,
  college VARCHAR,
  born INT,
  birth_city VARCHAR,
  birth_state VARCHAR
);
select * from players;
--importar los datos de players.csv a nuestra tabla

-- confirmar si los datos se importaron correctamente 
SELECT * FROM players;

-- Crear tabla para season_stats.csv llamada season_stats

CREATE TABLE seasons_stats (
  player_id INT,
  year DEC,
  position VARCHAR,
  age DEC,
  Tm VARCHAR,
  G VARCHAR,
  TS_Percentage DEC,
  FTr DEC,
  OWS DEC,
  DWS DEC,
  WS DEC,
  FG DEC,
  FGA DEC,
  FG_Percentage DEC,
  Two_Points DEC,
  Two_PA DEC,
  Two_Point_Percentage DEC,
  eFG_Percentage DEC,
  FT DEC,
  FTA DEC,
  FT_Percentage DEC,
  AST DEC,
  PF DEC,
  PTS DEC
);

--importar los datos de seasons_stats.csv a nuestra tabla

-- confirmar si los datos se importaron correctamente 
select * from seasons_stats;
--JOIN: Combina filas de dos o más tablas basándose en una condición relacionada.


/*Seleccionar todas las columnas de las tablas players y season_stats, haciendo un INNER join entre las tablas
(el join se hará en players.id = seasons_stats.player_id)
*/
select * from players
inner join seasons_stats
on players.id = seasons_stats.player_id 

/*Seleccionar las siguiente columnas: id, player, height, weight, college, born de la tabla players,
y las siguientes columnas: position, tm de la tabla seasons_stats;
haciendo un LEFT join entre las tablas 
(el join se hará en players.id = seasons_stats.player_id)
*/
select players.id, 
players.player, 
players.height,
players.weight, 
players.college, 
players.born,
seasons_stats.position, 
seasons_stats.tm
from players
left join seasons_stats
on players.id=seasons_stats.player_id
--Realizar la consulta anterior, dándole alias a las 2 tablas
select m.id, 
m.player, 
m.height,
m.weight, 
m.college, 
m.born,
c.position, 
c.tm
from players as m
left join seasons_stats as c
on m.id= c.player_id

--A RESOLVER
--Queremos saber de que ciudad y de que estado provienen los jugadores, asi como sus puntos, para esto haremos lo siguiente:
/*Seleccionar las siguiente columnas: player, birth_city, birth_state de la tabla players,
y la siguientes columna: pts de la tabla seasons_stats
haciendo un INNER join entre las tablas 
(el join se hará en players.id = seasons_stats.player_id),
recuerda darle alias a las 2 tablas
*/
select d.player, d.birth_city, d.birth_state, x.pts
from players as d 
inner join seasons_stats as x 
on d.id= x.player_id 


--Extra: Cuántos puntos en total tiene cada jugador? *Pista: Usa las clásulas GROUP BY y SUM
--select * from seasons_stats;
select d.player, d.birth_city, d.birth_state, sum (x.pts) 
from players as d 
inner join seasons_stats as x 
on d.id= x.player_id 
group by 1,2,3;
