-- Ejercicio 11: Tareas

-- 1. Encuentra la cantidad de artistas en el estudio (sin cláusula **HAVING**)
select count(*) as cantidad
from empleados
where role='Artista'
-- 2. Encuentre la cantidad de empleados de cada rol en el estudio.
select role,count(*) as cantidad
from empleados
group by role