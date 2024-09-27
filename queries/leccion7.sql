-- 1. Encuentre la lista de todos los edificios que tienen empleados.
select DISTINCT E.Nombre_Del_Edificio
from edificios as E
INNER JOIN empleados as Emp
ON E.Nombre_Del_Edificio=Emp.Edificio
-- 2. Encuentra la lista de todos los edificios y su capacidad.
select distinct E.nombre_del_Edificio, E.capacidad
from edificios as E 
left join Empleados AS Emp
on E.nombre_del_Edificio=Emp.edificio
-- 3. Enumere todos los edificios y las distintas funciones de los empleados en cada edificio (incluidos los edificios vacíos)
select E.nombre_del_Edificio, coalesce(Empl.role,'SIN EMPLEADOS') as Funcion_empleados
from edificios as E
left join empleados as Empl ON E.nombre_del_Edificio = Empl.Edificio

