-- 1. Encuentre la lista de todos los edificios que tienen empleados.
select DISTINCT E.Nombre_Del_Edificio
from edificios as E
INNER JOIN empleados as Emp
ON E.Nombre_Del_Edificio=Emp.Edificio
-- 2. Encuentra la lista de todos los edificios y su capacidad.

-- 3. Enumere todos los edificios y las distintas funciones de los empleados en cada edificio (incluidos los edificios vacíos)