-- Encuentra todas las películas de Toy Story
select titulo,director
from movie
where titulo like 'Toy Story%'

-- Encuentra todas las películas dirigidas por Juan Lasseter

select titulo
from movie
where director='Juan Lasseter'

-- Encuentra todas las películas (y director) no dirigidas por Juan Lasseter
select titulo,director
from movie
where director != 'Juan Lasseter'
-- Encuentra todas las películas de WALL-
select titulo
from movie
where titulo like 'WALL-%'