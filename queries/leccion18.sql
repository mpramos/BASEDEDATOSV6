-- Encontrar todas las películas cuyo año de estreno esté entre 2000 y 2010.
select *
from movie
where anio BETWEEN 2000 and 2010
-- Obtener las pelicula con la duración maxima y minima
select MIN(duracion_minutos) as duracion_minima, MAX(duracion_minutos)as duracion_maxima
from movie
--alter
alter table movie add column genero text
select * from movie	
	