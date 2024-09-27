-- Lista de todos los directores de películas de Pixar (alfabéticamente), sin duplicados
select distinct director
from movie
order by director ASC
-- Enumera las últimas cuatro películas de Pixar estrenadas (ordenadas de la más reciente a la menos)
select * 
from movie
order by anio desc limit 4
-- Enumera las primeras cinco películas de Pixar ordenadas alfabéticamente
select * 
from movie
order by titulo asc limit 5

-- Enumera las próximas cinco películas de Pixar ordenadas alfabéticamenteselect titulo
from movie
where anio> 2000
order by titulo asc
limit 5
