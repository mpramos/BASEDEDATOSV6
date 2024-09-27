--! VISTAS
create table empleados (
    id serial primary key,
    nombre varchar(100),
    puesto varchar(50),
    estado varchar(20) 
);
insert into empleados(nombre,puesto,estado) values 
('Ana Pérez', 'Gerente','Activo'),
('Carlos Díaz', 'Desarrollador','Inactivo'),
('María Gómez', 'Contador','Activo');

select nombre, puesto
from empleados
where estado='Activo'

create table ventas(
    id serial primary key,
    cliente varchar(100),
    total numeric(10,2)
);
insert into ventas(cliente,total) values
('EMPRESA A', 1500.00),
('CLIENTE B', 800.00),
('CLIENTE C', 1200.00);

create view ventas_grandes as
select cliente,total
from ventas
where total>1000


create table productos(
    id serial primary key,
    nombre varchar(100),
    precio numeric(10,2),
    en_stock BOOLEAN
);

insert into productos(nombre,precio,en_stock) values
('Laptop',1200.00,true),
('Mouse',25.00,false),
('Teclado',45.00,true);

create view productos_disponibles as
select nombre, precio
from productos
where en_stock=true;

create table salarios (
    id serial primary key,
    empleado_id int,
    salario numeric(10,2)
);
insert into salarios(empleado_id,salario) values
(1,2500.00),
(2,1800.00),
(3,2100.00);

create view empleados_sueldos_altos as
select e.nombre, s.salario
from empleados e
join salarios s on e.id=s.empleado_id
where s.salario> 2000

create table compras (
    id serial primary key,
    cliente varchar(100),
    total numeric(10,2)
);
insert into compras (cliente, total) values
('Cliente A', 500.00),
('Cliente B', 200.00),
('Cliente A', 300.00),
('Cliente C', 700.00);


create view compras_por_Clientes as
select cliente, SUM(total) as total_compras
from compras
group by cliente

create table ventas_diarias(
    id serial primary key,
    fecha date,
    total numeric(10,2)
);

insert into ventas_diarias(fecha,total) values
('2024-09-01',1200.00),
('2024-09-02',900.00),
('2024-09-01',700.00);

create view ventas_por_Fecha as
select fecha, sum(total) as total_dia
from ventas_diarias
group by fecha;


create view clientes_frecuentes as
select cliente,count(id) as numero_compras
from compras
group by cliente
having count(id)>1;


create view productos_descuento as
select nombre, precio * 0.9 as precio_con_descuento
from productos
where en_stock=true

alter table empleados add departamento varchar(50);

update empleados set departamento = 'Ventas' where id=1;
update empleados set departamento = 'IT' where id=2;
update empleados set departamento = 'Finazas' where id=3;

create view salarios_departamento as
select departamento, sum(salario) as total_salarios
from empleados e
join salarios s on e.id= s.empleado_id
group by departamento


create view productos_precio_alto as
select nombre, precio
from productos
where precio > (select avg(precio)
from productos)





