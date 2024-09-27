--! Introducción a las Subconsultas

--? Tipos de subconsultas:
--* Subconsultas en la cláusula WHERE.
--* Subconsultas en la cláusula FROM (Subconsultas derivadas o tablas temporales).
--* Subconsultas en la cláusula SELECT.
--* Subconsultas correlacionadas vs. no correlacionadas.

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE pedidos(
    pedidos_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    fecha_pedido DATE,
    total DECIMAL
);
CREATE TABLE productos(
    productos_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL
);

CREATE TABLE detalles_pedido(
    detalles_id SERIAL PRIMARY KEY,
    pedidos_id INT REFERENCES pedidos(pedidos_id),
    product_id INT REFERENCES productos(productos_id),
    cantidad INT,
    precio_unitario DECIMAL
);
insert into clientes(nombre,email) VALUES
('Juan Perez', 'juan.perez@gmail.com'),
('Ana Garcìa', 'ana.garcia@gmail.com');

select * from clientes
insert into productos(nombre,precio) VALUES
('Laptop',1500.00),
('Mouse',20.00),
('Teclado',50.00);

insert into pedidos(cliente_id,fecha_pedido,total) VALUES
(3,'2024-01-10',1520.00),
(4,'2024-01-11',70.00);
select * from pedidos
select * from productos

insert into detalles_pedido(pedidos_id,product_id,cantidad,precio_unitario) VALUES
(7,7,1,1500.00),
(7,8,1,20.00),
(8,9,1,50.00),
(8,8,1,20.00);

--* Ejemplo: Obtener todos los clientes que hayan hecho pedidos con un monto superior a 1000.

SELECT nombre,email
FROM clientes
WHERE cliente_id IN (
    SELECT cliente_id
    FROM pedidos
    where total > 1000)
--* Ejemplo: Obtener el total de cada cliente agrupado por nombre utilizando una 
--* subconsulta derivada.


SELECT c.nombre,total_pedido.total
FROM clientes c
JOIN (
    SELECT cliente_id, SUM(total) AS total
    FROM pedidos
    GROUP BY cliente_id
) AS total_pedido
ON c.cliente_id= total_pedido.cliente_id

--* Ejemplo: Mostrar el nombre del cliente junto con el total de pedidos que ha realizado.

SELECT nombre,
(
SELECT COUNT(*)
FROM pedidos
WHERE pedidos.cliente_id= clientes.cliente_id
) AS total_pedidos
FROM clientes;

--? Ejemplo: Listar los productos que aparecen en más de un pedido.

SELECT nombre
FROM productos p
WHERE EXISTS (
    SELECT 1
    FROM detalles_pedido d
    WHERE d.product_id = p.productos_id
    GROUP BY d.product_id
    HAVING COUNT(*) > 1
);

--? Ejemplo: Mostrar los clientes cuyos pedidos han sido mayores que cualquier
--?  otro pedido hecho por otros clientes.

SELECT nombre
FROM clientes c
where EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id=c.cliente_id
    AND p.total > ANY (
        SELECT total
        FROM pedidos
        WHERE cliente_id != c.cliente_id
    )
)




