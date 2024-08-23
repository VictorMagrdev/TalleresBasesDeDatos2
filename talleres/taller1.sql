create table clientes(
	identificacion varchar(9),
	Nombre varchar(30),
	edad int,
	correo varchar(255),
	primary key(identificacion)
);

create table productos(
	codigo varchar(13) primary key,
	nombre varchar(60) not null,
	stock int not null,
	valor_unitario float not null
);

create table pedidos (
	id SERIAL primary key,
	fecha date not null,
	cantidad int not null,
	valor_total float not null,
	producto_id varchar(13),
	cliente_id varchar(9),
	foreign key (producto_id) references productos(codigo)
);

begin;
	insert into clientes(identificacion,nombre,edad,correo) values('123456789', 'victor', 19, 'victorakiladev@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('123456730', 'fran', 21, 'fran@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('123456740', 'migue', 20, 'migue@gmail.com');
	

	insert into productos(codigo, nombre, stock, valor_unitario) values('7702011271733','galletas',12,1500.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('7702011271724','jugo',12,3000.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('7702011271725','chocolate',12,3500.0);

	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-23', 2, 3000.0,'7702011271733','123456789');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-23', 3, 4500.0,'7702011271733','123456789');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-23', 4, 6000.0,'7702011271733','123456789');
	
	update clientes set nombre = 'akila' where identificacion = '123456789';
	update clientes set edad = 22 where identificacion = '123456730';
	update productos set nombre = 'tostadas' where codigo = '7702011271724';
	update productos set stock = 9 where codigo = '7702011271725';
	update pedidos set cantidad = 1 where id = 1;
	update pedidos set fecha = '2024-10-30' where id = 2;

 	delete from pedidos WHERE id = 3;
 	delete from productos WHERE codigo = '7702011271725';
	delete from clientes WHERE identificacion = '123456740';
commit;