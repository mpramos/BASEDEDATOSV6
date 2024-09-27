CREATE OR REPLACE PROCEDURE nombre_procedimiento(parámetros)
LANGUAGE plpgsql
AS $$
BEGIN
-- CUERPO DEL PROCEDIMIENTO
END;
$$;
--? CREACIÓN DE TABLAS 
CREATE TABLE departamentos(
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE empleados(
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario NUMERIC(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
)
--? PROCEDIMIENTO PARA INSERTAR EMPLEADOS
CREATE OR REPLACE PROCEDURE insertar_empleado(
    p_nombre VARCHAR,
    p_salario NUMERIC,
    p_id_departamento INT
    )
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO empleados(nombre,salario,id_departamento)
    VALUES (p_nombre,p_salario,p_id_departamento);
END;
$$;
INSERT INTO departamentos (nombre) VALUES ('Recursos humanos');
INSERT INTO departamentos (nombre) VALUES ('Ingenieria');
INSERT INTO departamentos (nombre) VALUES ('Finanzas');
CALL insertar_empleado('Juan Pérez',5000,1);
--? PROCEDIMIENTO PARA ACTUALIZAR EL SALARIO DE UN EMPLEADO

CREATE OR REPLACE PROCEDURE actualizar_salario_empleado(
    p_id_empleado INT,
    p_nuevo_salario NUMERIC
)
LANGUAGE plpgsql
AS $$
    BEGIN
        UPDATE empleados
        SET salario=p_nuevo_salario
        WHERE id_empleado=p_id_empleado
    END;
$$;
CALL actualizar_salario_empleado(2,6000)
--?  PROCEDIMIENTO PARA ELIMINAR UN EMPLEADO
CREATE OR REPLACE PROCEDURE eliminar_empleado(
    p_id_empleado INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM empleados
    WHERE id_empleado=p_id_empleado
END;
$$:
CALL eliminar_empleado(2)