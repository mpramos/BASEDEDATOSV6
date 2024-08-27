--! Ejercicio 1: Tareas

--? 1. Encuentra el **`titulo`**de cada película.
select titulo from movie;
select titulo as titulo_pelicula from movie
--? 2. Encuentra el **`director`**de cada película.
select director from movie
select director as director_pelicula from movie
--? 3. Encuentra el **`title director`** y de cada película.
select titulo || '-👩-' ||director as titulo_director from movie
--? 4. Encuentra el **`titleyear`** y de cada película.
select titulo || '-👩-' ||anio as titulo_director from movie
--? 5. Encuentra **`all`** la información de cada película.
select * from movie