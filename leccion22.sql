create function suma(a int,b int)
returns int as $$
BEGIN
    RETURN a+b;
END;
$$ LANGUAGE plpgsql
create function multiplicar(a int,b int)
returns int as $$
BEGIN
    RETURN a*b;
END;
$$ LANGUAGE plpgsql

create table empleados(
    id serial primary key,
    nombre varchar(100),
    salario numeric
)

insert into empleados(nombre,salario)
values
('Juan',1000),
('Ana',1500),
('Carlos',2000);

create function obtener_salario(id_empleado int) returns numeric as $$
DECLARE
      salario_empleado numeric;
BEGIN
        select salario into salario_empleado from empleados where id=id_empleado;
        return salario_empleado;
END;
$$ LANGUAGE plpgsql;


select obtener_salario(1)
DROP FUNCTION IF EXISTS obtener_salario(int)

create function salario_anual(id_empleado int) returns numeric as $$
DECLARE 
    salario_anual numeric;
BEGIN
    select salario into salario_anual from empleados where id=id_empleado;
    return salario_anual*12;
END;
$$ LANGUAGE plpgsql;


create function obtener_nombre(id_empleado int) returns varchar as $$
DECLARE
    nombre_empleado varchar(100);

    BEGIN
        SELECT nombre into nombre_empleado from empleados where id=id_empleado;
        return nombre_empleado;
    END;
$$ LANGUAGE plpgsql;

select obtener_nombre(3)

create function calcular_bono(id_empleado int) returns numeric as $$
DECLARE
    salario_bono numeric;
    BEGIN
        SELECT salario into salario_bono from empleados where id=id_empleado;
        return salario * 0.1;
    END;
$$ LANGUAGE plpgsql;

select calcular_bono(1)


DROP FUNCTION IF EXISTS obtener_salario(int)

create function salario_con_bono(id_empleado int) returns numeric as $$
DECLARE
    salario_bono numeric;
    bono numeric;
    BEGIN
        SELECT salario into salario_bono from empleados where id=id_empleado;
        bono := salario_bono*0.1;

        return salario_bono + bono;
    END;
$$ LANGUAGE plpgsql;

create function comparar_salario(id_empleado1 int, id_empleado2 int) returns varchar as $$
DECLARE
    salario1 numeric;
    salario2 numeric;
BEGIN
    SELECT salario into salario1 from empleados where id=id_empleado1;
    SELECT salario into salario2 from empleados where id=id_empleado2;

    IF salario1 > salario2 then
        return 'Empleado 1 tiene un salario mayor';
    else 
          return 'Empleado 2 tiene un salario mayor';
    END if;       

END;
$$ LANGUAGE plpgsql;

select comparar_salario(1,2)

create FUNCTION es_mayor_salario(id_empleado int, monto numeric) returns BOOLEAN as $$
DECLARE
    salario_empl numeric;
BEGIN
    select salario into salario_empl from empleados where id=id_empleado;
    return salario > monto;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS es_mayor_salario(int,numeric)
select es_mayor_salario(3,1800)

create function promedio_Salarios() returns numeric as $$
DECLARE
    promedio numeric;
    BEGIN
        SELECT AVG(salario) into promedio from empleados;
        return promedio;
    END;
$$ LANGUAGE plpgsql;










