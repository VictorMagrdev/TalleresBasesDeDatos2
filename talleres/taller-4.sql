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

create or replace procedure verificar_stock(
	p_producto_id VARCHAR(13),
	p_cantidad_compra INT 
)
language plpgsql
as $$
declare 
	v_stock_producto NUMERIC;
begin
	select stock into v_stock_producto from productos where codigo = p_producto_id;
	if v_stock_producto >= p_cantidad_compra then
		raise notice 'hay suficiente stock';
	else
		raise notice 'no hay suficiente stock';
	end if;
end;
$$;

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
commit;

call verificar_stock('2387648299234',3);

create or replace procedure actualizar_estado_pedido(
	p_factura_id INT,
	p_nuevo_estado PEDIDO_ESTADO
)
language plpgsql
as $$
declare 
	v_estado_pedido PEDIDO_ESTADO;
begin
	select pedido_estado into v_estado_pedido from facturas where id = p_factura_id;
	if v_estado_pedido != 'ENTREGADO' then
		update facturas set pedido_estado = p_nuevo_estado where id = p_factura_id;
		raise notice 'se actualizo el estado del pedido';
	else
		raise notice 'el pedido ya fue entregado';
	end if;
end;
$$;

begin;
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 2, 9000.0,'PENDIENTE','2387648299234','213298923');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 3, 8500.0,'PENDIENTE','2387648299234','987829349');
	insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-08-26', 4, 7000.0,'PENDIENTE','2387648299234','987829349');
commit;
call actualizar_estado_pedido(4,'ENTREGADO');
call actualizar_estado_pedido(3,'BLOQUEADO');
