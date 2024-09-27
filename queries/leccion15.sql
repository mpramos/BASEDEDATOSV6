-- Ejercicio 15: Tareas

-- 1. Esta base de datos se está volviendo demasiado grande, 
-- eliminemos todas las películas que se estrenaron **antes de** 2005.

delete from movie
where anio<2005
select * from movie
