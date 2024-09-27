-- Ejercicio 12: Tareas
-- 1. Calcula el número de películas que ha dirigido cada director.
select * from taquilla
select director,count(*) as numero_peliculas_dirigidas
from movie
group by director
-- 2. Encuentre el total de ventas nacionales e internacionales que se pueden atribuir a cada director.
select P.director, SUM(T.ventas_locales) as  ventas_nacionales,SUM(T.ventas_internacionales) as ventas_internacionales
from movie P
join taquilla T on P.identificacion=T.id_pelicula
group by P.director


