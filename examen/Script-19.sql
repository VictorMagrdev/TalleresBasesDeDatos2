create table Usuarios(
	id serial primary key,
	nombre varchar,
	direccion varchar,
	email varchar,
	fecha_registro date,
	estado varchar
)

create table Tarjetas(
	id serial primary key,
	numero_tarjeta varchar,
	fecha_expiracion date,
	cvv varchar,
	tipo_tarjeta varchar
)

create table productos(
	id serial primary key,
	codigo_producto varchar,
	nombre varchar,
	categoria varchar,
	porcentaje_impuesto float,
	precio float
)

create table pagos(
	id serial primary key,
	codigo_pago varchar,
	fecha date,
	estado varchar,
	monto float,
	producto_id int references productos(id),
	tarjeta_id int references Tarjetas(id),
	usuario_id int references Usuarios(id)
)

create table comprobantes_pago(
	id serial primary key,
	destalle_xml xml,
	detalle jsonb
)
-- primera seccion
create or replace function obtener_pagos_de_un_usuario(p_usuario_id int, p_fecha_id date )
returns table(
	codigo_pago varchar,
	nombre_producto varchar,
	monto float,
	estado varchar
) 
as $$
begin

	return query select codigo_pago,p.nombre as nombre_producto, monto, estado from pagos inner join productos as p on p.id = producto_id where fecha = p_fecha_id;
end;
$$
language plpgsql;

create or replace function obtener_tarjetas_monto_mil(p_usuario_id int)
returns table(
    nombre_usuario varchar,
    email varchar,
    numero_tarjeta float,
    cvv varchar,
    tipo_tarjeta varchar
)
as $$
declare
    v_tarjeta_id int;
begin
    select tarjeta_id into v_tarjeta_id from pagos where usuario_id = p_usuario_id and monto > 1000.0;
    
    return query 
    select u.nombre_usuario,u.email,t.numero_tarjeta,t.cvv,t.tipo_tarjeta from usuarios u inner join tarjetas t on t.id = v_tarjeta_id;
end;
$$
language plpgsql;

--segunda seccion
--con cursor obtener numero taerjeta fecha expiracioo nombre email 
--con cursor pagos menores a 1000 dada una fecharetornar un varchar con monto, estado, nombre producto, procentaje impuesto, usuario direccion, email
create or replace obtener_tajetas_detalle_de_usuario(p_usuario_id int)
return varchar
as $$ 
declare
     v_cursor_datos cursor for select * from nombre_tabla;
 begin
     open v_cursor_datos;
      fetch v_cursor_datos into v_tarjeta, v_fecha,v_nombre,v_mail;
     close v_cursor_datos;
 end;
$$

--parte 3
insert into comprobantes_pago(destalle_xml,detalle) values('<pago><codigoPago></codigoPago><nombreUsuario></nombreUsuario><numeroTarjeta></numeroTarjeta><nombreProducto></nombreProducto><montoPago></montoPago> </pago>',null);
create or replace procedure guardar_xml()
language plpgsql
as $$
declare
	v_xml xml;
begin
	v_xml := xmlparse(document '<pago><codigoPago></codigoPago><nombreUsuario></nombreUsuario><numeroTarjeta></numeroTarjeta><nombreProducto></nombreProducto><montoPago></montoPago> </pago>');
	insert into comprobantes_pago(destalle_xml,detalle) values(v_xml,null);
end;
$$

create or replace procedure guardar_json()
language plpgsql
as $$

begin
	
	insert into comprobantes_pago(destalle_xml,detalle) values(null,'{"emailUsuario":"","numeroTarjeta":"","Tipotarjeta":"","codigoProducto":"","codigoPago":"","montoPago:""}');
end;
$$

create or replace function validaciones_producto() 
returns trigger as $$
begin
    if precio > 0.0 and precio < 20000.0 and porcentaje_impuesto >= 0.01 and porcentaje_impuesto >= 0.2 then
        raise notice 'producto no valido';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger validaciones_producto
before insert
on productos
for each row
execute function validaciones_producto();
 -- parte 5

create sequence codigoProductoSecuencia
     increment by 5
     minvalue 5
     start with 5;
    
create sequence codigoPagosSecuencia
     increment by 100
     minvalue 100
     start with 100;



