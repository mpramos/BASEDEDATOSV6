--! JOINS
select M.titulo, T.Clasificacion,T.Ventas_locales
from Movie M
inner join Taquilla T on M.Identificacion = T.id_pelicula
select M.titulo, T.Clasificacion,T.Ventas_locales
from Movie M
left join Taquilla T on M.Identificacion = T.id_pelicula
--! MultiJoins
--* Los MultiJoins permiten combinar más de dos tablas.
--? Ejemplo 1: Obtener las películas, los edificios donde trabajan los empleados de ingenieria,
--?  y las clasificaciones de taquilla.
SELECT M.titulo, E.Nombre, B.Nombre_Del_Edificio, T.clasificacion
FROM movie M
JOIN Taquilla T ON M.Identificacion = T.id_pelicula
JOIN Edificios B ON E.Edificio = B.Nombre_Del_Edificio
JOIN Empleados E ON E.Role ='Ingeniero'
--? Ejemplo 2: Mostrar películas, empleados de rol gerente que trabajan en la misma, y ventas internacionales.
SELECT M.titulo, E.Nombre, T.Ventas_Internacionales
FROM MOVIE M
JOIN Taquilla T ON M.Identificacion=T.id_pelicula
JOIN Empleados E ON Role = 'Gerente'
--? Ejemplo 3: Mostrar películas,las clasificaciones y los edificios asociados con los empleados relacionados 
--? con el departamento de arte 'artistas' peliculas. y tambien mostrar la capacidad del edificio
SELECT M.titulo, T.clasificacion, E.nombre,B.Capacidad
FROM MOVIE M
JOIN TAQUILLA T ON M.Identificacion= T.id_pelicula
JOIN Empleados E ON E.ROLE='Artista'
JOIN EDIFICIOS B ON E.Edificio = B.Nombre_Del_Edificio
--! FUNCIONES DEFINIDAS POR EL USUARIO
--* Las funciones definidas por el usuario permiten crear operaciones personalizadas.
--? Ejemplo 1: Crear una función para calcular el total de ventas (locales + internacionales).

CREATE OR REPLACE FUNCTION calcular_el_total_de_ventas(Ventas_locales BIGINT,Ventas_Internacionales BIGINT)
RETURNS BIGINT AS $$
BEGIN
    RETURN Ventas_locales + Ventas_Internacionales
END;
$$ LANGUAGE plpgsql

SELECT M.titulo,calcular_el_total_de_ventas(Ventas_locales,Ventas_Internacionales) as Ventas_Totales
from Taquilla T JOIN Movie M on T.id_pelicula =M.identificacion
--? Ejemplo 2: Función para verificar si una película es un éxito (ventas totales > 500 millones).
CREATE OR REPLACE FUNCTION es_exitoso(Ventas_Totales BIGINT)
RETURNS BOOLEAN AS $$
    BEGIN
       RETURN   Ventas_Totales > 500000000;
    END
$$ LANGUAGE plpgsql;

select M.titulo,es_exitoso(Ventas_locales+Ventas_Internacionales) AS Es_exito
from TAQUILLA T JOIN movie M on T.id_pelicula =M.identificacion

--? Ejemplo 3: Función para calcular el promedio de ventas locales.






