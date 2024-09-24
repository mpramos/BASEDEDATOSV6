CREATE TABLE imagenes_rutas(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ruta VARCHAR(255) NOT NULL
)

INSERT INTO imagenes_rutas(nombre, ruta)
VALUES ('imagen1.jpg','/ruta/al/archivo/imagen1.jpg')



CREATE TABLE imagenes_bytea(
    id serial primary key,
    nombre VARCHAR(255) NOT NULL,
    imagen BYTEA NOT NULL
)
INSERT INTO imagenes_bytea (nombre, imagen)
VALUES ('imagen1.jpg', pg_read_binary_file('/ruta/al/archivo/imagen1.jpg'));


