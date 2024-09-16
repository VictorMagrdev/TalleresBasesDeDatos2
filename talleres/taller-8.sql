create table usuarios(
	id serial primary key,
	nombre varchar(55) not null,
	identificacion varchar(23) not null unique,
	edad int not null,
	correo varchar(65) not null
)

create or replace procedure poblar_usuarios()
	language plpgsql
	as $$
		declare
		v_numero_aleatorio integer;
		v_identificacion integer;
		v_name varchar := 'mualani_';
		v_username varchar := 'mualani_';
		begin
			FOR i IN 1..50 LOOP
				v_numero_aleatorio := floor(random() * 10000) + 1;
				v_identificacion := floor(random() * 10000) + 1;
				v_name = v_username || i;
				insert into usuarios(nombre, identificacion, edad, correo) values(v_name,v_identificacion,v_numero_aleatorio,'test@gmai.com');
			END LOOP;
		end;
	$$;
	
create table facturas(
	fecha date,
	producto varchar(13) primary key,
	cantidad int,
	valor_unitario float,
	valor_total float,
	usuario_id int,
	foreign key (usuario_id) references usuarios(id)
)

create or replace procedure poblar_facturas()
	language plpgsql
	as $$
		declare
		v_fecha date := '2024-09-14';
		v_producto_name varchar := 'producto_';
		v_producto varchar;
		v_cantidad integer;
		v_valor_unitario integer;
		v_valor_total integer;
		v_usuario integer;
		begin
			FOR i IN 1..25 LOOP
				v_cantidad := floor(random() * 100) + 1;
				v_valor_unitario := floor(random() * 10000) + 1;
				v_valor_total := floor(random() * 10000) + 1;
				v_usuario := floor(1 + random() * 50)::int;
				v_producto = v_producto_name || i;
				insert into facturas(fecha, producto, cantidad, valor_unitario,valor_total, usuario_id) values(v_fecha,v_producto,v_cantidad,v_valor_unitario,v_valor_total,v_usuario);
			END LOOP;
		end;
	$$;

call poblar_usuarios();
call poblar_facturas();

create or replace procedure prueba_identificacion_unica()
language plpgsql
as $$
declare
	v_identificacion integer;
begin
	insert into usuarios(nombre, identificacion, edad, correo) values('pablo',7581,40,'test@gmai.com');

exception
	when unique_violation then
		v_identificacion := floor(random() * 10000) + 1;
		insert into usuarios(nombre, identificacion, edad, correo) values('pablo',v_identificacion,40,'test@gmai.com');
		raise exception 'ya existe un usuario con la indetificacion: %', sqlerrm;
    when others then
        raise exception 'Error al insertar usuario: %', sqlerrm;
		rollback;
end;
$$;

call prueba_identificacion_unica();

create or replace procedure prueba_producto_vacio()
language plpgsql
as $$
declare
	v_identificacion integer;
begin
	insert into usuarios(nombre, identificacion, edad, correo) values('pablo',7581,40,'test@gmai.com');

exception
	when unique_violation then
		v_identificacion := floor(random() * 10000) + 1;
		insert into usuarios(nombre, identificacion, edad, correo) values('pablo',v_identificacion,40,'test@gmai.com');
insert into facturas(fecha, producto, cantidad, valor_unitario,valor_total, usuario_id) 
values(v_fecha,v_producto,v_cantidad,v_valor_unitario,v_valor_total,v_usuario);
	
		raise exception 'ya existe un usuario con la indetificacion: %', sqlerrm;
    when others then
        raise exception 'Error al insertar usuario: %', sqlerrm;
		rollback;
end;
$$;

call prueba_producto_vacio();

create or replace procedure prueba_cliente_debe_existir()
language plpgsql
as $$
begin
		insert into facturas(fecha, producto, cantidad, valor_unitario,valor_total, usuario_id) 
		values('2024-09-14','cat foot',15,1500.0,5000.0,45);
		insert into facturas(fecha, producto, cantidad, valor_unitario,valor_total, usuario_id) 
		values('2024-09-14','churu',15,1500.0,5000.0,55);

exception
	when foreign_key_violation then
		raise exception 'el id suministrado no corresponde a un usuario registrado: %', sqlerrm;
    when others then
        raise exception 'Error al insertar facturas: %', sqlerrm;
		rollback;
end;
$$;

call prueba_cliente_debe_existir();
