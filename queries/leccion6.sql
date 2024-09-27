-- Encuentra las ventas nacionales e internacionales de cada película
select P.titulo , T.ventas_locales,T.ventas_internacionales
from movie as P
join taquilla as T on P.identificacion=T.id_pelicula
-- Muestra las cifras de ventas de cada película que tuvo un mejor desempeño internacional en lugar de a nivel nacional
select P.titulo,T.ventas_locales,T.ventas_internacionales
from movie as P
join taquilla as T on P.identificacion=T.id_pelicula 
where T.ventas_internacionales >T.ventas_locales
-- Enumere todas las películas por sus calificaciones en orden descendente
select P.titulo as Pelicula,T.clasificacion
from movie as P
join taquilla as T on P.identificacion=T.id_pelicula 
order by T.clasificacion DESC