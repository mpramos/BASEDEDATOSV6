--! PARTICIONES 

--? PARTICIONES POR RANGO(Range Partitioning)
CREATE TABLE ventas (
    id SERIAL,
    region TEXT,
    fecha DATE NOT NULL,
    total NUMERIC,
    PRIMARY KEY(id,fecha)
) PARTITION BY RANGE (fecha);

--* CREACION DE SUBTABLA
CREATE TABLE ventas_2023 PARTITION OF ventas
    FOR VALUES FROM ('2023-01-01') TO ('2023-12-31')
CREATE TABLE ventas_2024 PARTITION OF ventas
    FOR VALUES FROM ('2024-01-01') TO ('2024-12-31')

INSERT INTO ventas (region, fecha, total) VALUES 
('Asia','2024-09-01',4500),   
('Europa','2024-09-01',1500),   
('Asia','2024-09-02',2300),   
('Europa','2024-09-03',1500),   

select * from ventas_2024
select * from ventas_2023
--? PARTICIONES POR LISTA
-- Crear una nueva tabla particionada por lista (regiones)
CREATE TABLE ventas_por_region (
    id SERIAL,
    region TEXT,
    fecha DATE NOT NULL,
    total NUMERIC,
    PRIMARY KEY(id,region)
) PARTITION BY LIST(region)

CREATE TABLE ventas_europa PARTITION OF ventas_por_region
FOR VALUES IN ('Europa');

CREATE TABLE ventas_asia PARTITION OF ventas_por_region
FOR VALUES IN ('Asia');

INSERT INTO ventas_por_region (region, fecha, total) VALUES 
('Asia','2024-09-01',4500),   
('Europa','2024-09-01',1500),   
('Asia','2024-09-02',2300),   
('Europa','2024-09-03',1500)   
-- Particiones por Hash
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    ciudad VARCHAR(50)
) PARTITION BY Hash(id)

CREATE TABLE cliente_p0 PARTITION OF clientes
FOR VALUES WITH(MODULUS 4,REMAINDER 0)
CREATE TABLE cliente_p1 PARTITION OF clientes
FOR VALUES WITH(MODULUS 4,REMAINDER 1)
CREATE TABLE cliente_p2 PARTITION OF clientes
FOR VALUES WITH(MODULUS 4,REMAINDER 2)
CREATE TABLE cliente_p3 PARTITION OF clientes
FOR VALUES WITH(MODULUS 4,REMAINDER 3)

INSERT INTO clientes (nombre,edad,ciudad)
VALUES
    ('Carlos', 30,'Madrid'),
    ('Ana', 25,'Barcelona'),
    ('Luis', 35,'Sevilla'),
    ('Elena', 28,'Valencia'),
    ('Marta', 22,'Valencia')

