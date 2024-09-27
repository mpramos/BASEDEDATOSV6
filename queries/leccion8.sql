-- Ejercicio 8: Tareas

-- 1. Encuentre el nombre y la función de todos los empleados que no han sido asignados a un edificio
select emp.nombre, emp.role
from empleados as emp
left join edificios as E on E.nombre_del_Edificio=emp.edificio
where emp.edificio  IS NULL
-- 2. Encuentre los nombres de los edificios que no tienen empleados.
select e.nombre_del_Edificio
from edificios as e
left join empleados as emp on e.nombre_del_Edificio=emp.edificio
where emp.edificio  IS NULL

