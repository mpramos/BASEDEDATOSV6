-- Ejercicio 10: Tareas

-- 1. Encuentre el tiempo más largo que un empleado ha estado en el estudio
select max(años_empleado) as Tiempo_Mas_Largo
from empleados
-- 2. Para cada puesto, encuentre el número promedio de años empleados por los empleados en ese puesto.
select role, avg(años_empleado) as promedio_años
from empleados
group by role
-- 3. Encuentre el número total de años de empleados trabajados en cada edificio.
select edificio,sum(años_empleado) as años_total_trabajados
from empleados
group by edificio 