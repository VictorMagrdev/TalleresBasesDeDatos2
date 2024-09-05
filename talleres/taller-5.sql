create table clientes(
	identificacion varchar(9),
	Nombre varchar(30),
	edad int,
	correo varchar(255),
	primary key(identificacion)
);

create table productos (
	codigo varchar(13) primary key,
	nombre varchar(60) not null,
	stock int not null,
	valor_unitario float not null
);

CREATE TYPE pedido_estado AS ENUM('PENDIENTE','BLOQUEADO','ENTREGADO');

create table facturas (
	id SERIAL primary key,
	fecha date not null,
	cantidad int not null,
	valor_total float not null,
	pedido_estado PEDIDO_ESTADO not null,
	producto_id varchar(13),
	cliente_id varchar(9),
	foreign key (producto_id) references productos(codigo),
	foreign key (cliente_id) references clientes(identificacion)
);

begin;
	insert into clientes(identificacion,nombre,edad,correo) values('213298923', 'acheron', 19, 'lea@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('987829349', 'robert', 21, 'rust@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('876238782', 'ocalm', 20, 'ocalm@gmail.com');

	insert into productos(codigo, nombre, stock, valor_unitario) values('2387648299234','carta',12,1500.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('9009324799832','pañuelo',12,3000.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('3904290493879','lapiz',12,3500.0);

	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 2, 9000.0,'ENTREGADO','2387648299234','213298923');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 3, 8500.0,'ENTREGADO','2387648299234','987829349');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 4, 7000.0,'ENTREGADO','2387648299234','987829349');

	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 2, 9000.0,'PENDIENTE','2387648299234','213298923');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 3, 8500.0,'PENDIENTE','2387648299234','987829349');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 4, 7000.0,'PENDIENTE','2387648299234','987829349');
commit;

create or replace procedure obtener_total_stock()
language plpgsql
as $$
	declare
	v_total_stock integer := 0;
	v_stock_actual integer;
	v_nombre_producto varchar;
begin
	for v_nombre_producto, v_stock_actual in select nombre, stock from productos
	loop
		raise notice 'el nombre del prodcuto es: %', v_nombre_producto;
		raise notice 'el stock actual del prodcuto es: %', v_stock_actual;
		v_total_stock := v_total_stock + v_stock_actual;
	end loop;
	raise notice 'el stock total es: %', v_total_stock;
	
end;
$$;
call obtener_total_stock();
