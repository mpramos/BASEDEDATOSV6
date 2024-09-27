-- 1. Agregue una columna llamada **Aspect_ratio FLOAT** con un tipo de datos para almacenar la 
-- relación de aspecto en la que se lanzó cada película.
alter table movie
add column  Aspect_ratio float
select * from movie
-- 2. Agregue otra columna denominada **Idioma TEXTO el inglés** con un tipo de datos 
-- para almacenar el idioma en el que se estrenó la película. Asegúrese de que el idioma predeterminado para este idioma sea ingles.
alter table movie
add column Idioma TEXT default 'ingles'