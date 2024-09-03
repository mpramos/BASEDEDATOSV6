-- Ejercicio 9: Tareas

-- 1. Enumere todas las películas y sus ventas combinadas en **millones**
--     de dólares.
select P.titulo, T.ventas_locales+ T.ventas_internacionales as ventas_En_millones
from movie as P
join taquilla as T on P.identificacion=T.id_pelicula
    
-- 2. Enumere todas las películas y sus calificaciones **en porcentaje.**
select P.titulo, T.Clasificacion * 100 as Clasificacion_porcentaje
from movie as P
join taquilla as T on P.identificacion=T.id_pelicula
-- 3. Enumere todas las películas que se estrenaron en años pares.
