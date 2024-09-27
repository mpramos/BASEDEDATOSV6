--! WHERE
    =,!=,<,<=.>,>=,=
    between min and max
    in
-- 1.- Mostrar la pelicula cuyo id sea 6
select *
from movie
where movie.identificacion=6
-- 2.- Mostrar la peliculas con el id 6 y 5
select *
from movie
where movie.identificacion in (6,5)
-- 3.- Mostrar la peliculas con el id 6 y 5
select *
from movie
where movie.identificacion not in (6,5)
-- 4.- Mostrar estrictamente la peliculas con el id 15 y 5
select *
from movie
where movie.identificacion=15 and movie.identificacion=5
-- 5.- Mostrar las peliculas con el id 15 o 5
select *
from movie
where movie.identificacion=15 or movie.identificacion=5
-- 6.- Mostrar las peliculas que se hayan estrenado entre el año 2000 y 2010
select * 
from movie
where movie.anio between 2000 and 2010
-- 7.- Mostrar las peliculas que no se hayan estrenado en el año 200 y 2010
select * 
from movie
where movie.anio not between 2000 and 2010