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
	insert into clientes(identificacion,nombre,edad,correo) values('129480249', 'victorm', 19, 'victorakiladev@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('124927943', 'fran', 21, 'fran@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('198032403', 'migue', 20, 'migue@gmail.com');

	insert into productos(codigo, nombre, stock, valor_unitario) values('7392402389040','galletas',12,1500.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('7703289794375','jugo',12,3000.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('7700283498789','chocolate',12,3500.0);

	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 2, 9000.0,'7392402389040','129480249');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 3, 8500.0,'7703289794375','124927943');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 4, 7000.0,'7700283498789','198032403');
	
	update clientes set nombre = 'akila' where identificacion = '129480249';
	update clientes set edad = 22 where identificacion = '124927943';
	update productos set nombre = 'tostadas' where codigo = '7392402389040';
	update productos set stock = 9 where codigo = '7700283498789';
	update pedidos set cantidad = 1 where id = 1;
	update pedidos set fecha = '2024-10-30' where id = 2;

 	delete from pedidos WHERE id = 3;
 	delete from productos WHERE codigo = '129480249';
	delete from clientes WHERE identificacion = '7700283498789';
rollback;

begin;
	insert into clientes(identificacion,nombre,edad,correo) values('213298923', 'acheron', 19, 'lea@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('987829349', 'robert', 21, 'rust@gmail.com');
	insert into clientes(identificacion,nombre,edad,correo) values('876238782', 'ocalm', 20, 'ocalm@gmail.com');

	insert into productos(codigo, nombre, stock, valor_unitario) values('2387648299234','carta',12,1500.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('9009324799832','pañuelo',12,3000.0);
	insert into productos(codigo, nombre, stock, valor_unitario) values('3904290493879','lapiz',12,3500.0);

	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 2, 9000.0,'2387648299234','213298923');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 3, 8500.0,'2387648299234','987829349');
	insert into pedidos(fecha,cantidad,valor_total,producto_id,cliente_id) values('2024-08-26', 4, 7000.0,'2387648299234','987829349');
	
	savepoint punto_de_restauracion;

	update clientes set nombre = 'firefly' where identificacion = '213298923';
	update clientes set edad = 22 where identificacion = '987829349';
	update productos set nombre = 'cartulina' where codigo = '2387648299234';
	update productos set stock = 9 where codigo = '2387648299234';
	update pedidos set cantidad = 1 where id = 1;
	update pedidos set fecha = '2024-10-30' where id = 2;

 	delete from pedidos WHERE id = 3;
 	delete from productos WHERE codigo = '3904290493879';
	delete from clientes WHERE identificacion = '8762382';
	
	rollback to savepoint punto_de_restauracion;
commit;