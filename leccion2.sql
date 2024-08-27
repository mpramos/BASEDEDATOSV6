--! WHERE
-- 1.- Mostrar la pelicula cuyo id sea 6
select *
from movie
where movie.identificacion=6
-- 2.- Mostrar las peliculas que se hayan estrenado entre el año 2000 y 2010
select * 
from movie
where movie.anio between 2000 and 2010
-- 3.- Mostrar las peliculas que no se hayan estrenado en el año 200 y 2010
select * 
from movie
where movie.anio not between 2000 and 2010