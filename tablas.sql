-- CREACION DE UNA TABLA SIEMPRE Y CUANDO ESTA TABLA NO EXISTA
create table if not exists Movie(
    Identificacion INTEGER PRIMARY KEY,
    titulo TEXT,
    director TEXT,
    anio INTEGER,
    duracion_minutos INTEGER
);
-- MOSTRAR TODAS LAS COLUMNAS (ATRIBUTOS) DE LA TABLA
select * from Movie;

-- INSERTANDO REGISTROS A NUESTRA TABLA DE MOVIE
insert into Movie values(1,'Historia del juguete','Juan Lasseter',1995,81);
INSERT INTO movie VALUES (2, 'La vida de un bicho', 'Juan Lasseter', 1998, 95);
INSERT INTO movie VALUES (3, 'Toy Story 2', 'Juan Lasseter', 1999, 93);
INSERT INTO movie VALUES (4, 'Monstruos inc.', 'Pete Docter', 2001, 92);
INSERT INTO movie VALUES (5, 'Buscando a Nemo', 'Andres Stanton', 2003, 107);
INSERT INTO movie VALUES (6, 'Los Increíbles', 'pájaro brad', 2004, 116);
INSERT INTO movie VALUES (7, 'Carros', 'Juan Lasseter', 2006, 117);
INSERT INTO movie VALUES (8, 'Ratatouille', 'pájaro brad', 2007, 115);
INSERT INTO movie VALUES (9, 'WALL-E', 'Andres Stanton', 2008, 104);
INSERT INTO movie VALUES (10, 'Arriba', 'Pete Docter', 2009, 101);
INSERT INTO movie VALUES (11, 'Toy Story 3', 'Lee Unkrich', 2010, 103);
INSERT INTO movie VALUES (12, 'coches 2', 'Juan Lasseter', 2011, 120);
INSERT INTO movie VALUES (13, 'Corajudo', 'Brenda Chapman', 2012, 102);
INSERT INTO movie VALUES (14, 'Monsters University', 'Daniel Scanlon', 2013, 110);
