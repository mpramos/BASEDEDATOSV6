--! SERIAL
--* Descripción: Se utiliza para crear una columna autoincremental
--? Ejemplo
create table empleado(
    id_empleado SERIAL PRIMARY KEY,
    Nombre TEXT,
    Role Text,
    Años_empleado INTEGER
)
insert into empleado (Nombre,Role,Años_empleado) values ('juan','desarrollador',8);
insert into empleado (Nombre,Role,Años_empleado) values ('mario','desarrollador',10);
insert into empleado (Nombre,Role,Años_empleado) values ('alejandro','desarrollador',1);
insert into empleado (Nombre,Role,Años_empleado) values ('susana','desarrollador',3);
insert into empleado (Nombre,Role,Años_empleado) values ('alejandra','desarrollador',8);
insert into empleado (Nombre,Role,Años_empleado) values ('jose','desarrollador',18);
insert into empleado (Nombre,Role,Años_empleado) values ('jaime','desarrollador',8);
--! B-TREE
--* Descripción: Se usa para mejorar la eficiencia de las consultas mediante la creacion de un indice basado en B-tree
CREATE INDEX idx_titulo ON MOVIE USING BTREE(titulo)

select indexname, indexdef
from pg_indexes
where tablename='movie'
--! DROP INDEX
DROP INDEX idx_titulo
--! Ìndice UNIQUE
CREATE UNIQUE INDEX  idx_nombre_unico on empleado(nombre)
--! ARRAY
alter table movie add column generos TEXT[];
update movie set generos = ARRAY['Animacion','Aventura'] where titulo like 'Toy Story %'

--!JSON
alter table movie add column detalles JSON;
UPDATE movie SET detalles='{"Presupuesto":30000,"Productor":"Pixar"}' where titulo like 'Toy Story %'

--! Clave Foránea (FK)
alter table Taquilla add CONSTRAINT fk_movie FOREIGN KEY(id_pelicula) REFERENCES MOVIE(Identificacion) 
