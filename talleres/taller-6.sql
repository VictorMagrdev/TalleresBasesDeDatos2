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


create table auditorias(
	id serial primary key,
	fecha_inicio date not null,
	fecha_final date not null,
	factura_id int not null,
	pedido_estado PEDIDO_ESTADO not null,
	foreign key (factura_id) references facturas(id)
);
create or replace procedure generar_auditoria(p_fecha_inicio date,p_fecha_final date)
language plpgsql
as $$
	declare
	v_fecha date;
	v_id integer;
	v_pedido_estado PEDIDO_ESTADO;
begin
	for v_fecha, v_id, v_pedido_estado in select fecha, id, pedido_estado from facturas loop
		if v_fecha BETWEEN fecha_inicio AND fecha_inicio THEN
			insert into auditorias(fecha_inicio,fecha_final,factura_id,pedido_estado) values (p_fecha_inicio,p_fecha_final,v_id,pedido_estado);
		END IF;
	end loop;
end;
$$;


create or replace procedure simular_ventas_mes()
language plpgsql
as $$
declare 
	v_dia integer := 1;
	v_identificacion varchar;
	random_cantidad integer;
	numero_aleatorio integer;
begin
	while v_dia <= 30 loop

		-- for tabla cientes
		for v_identificacion in select identificacion from clientes loop
			numero_aleatorio := 1 + floor(random() * 99);
			insert into facturas(fecha,cantidad,valor_total,pedido_estado,producto_id,cliente_id) values('2024-09-01', numero_aleatorio, 9000.0,'PENDIENTE','2387648299234',v_identificacion);
		end loop;
		v_dia := v_dia + 1;
		-- detro del for insert a facturas por cada cliente
	end loop;	
end;
$$;
CALL simular_ventas_mes();
