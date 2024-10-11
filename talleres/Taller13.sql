create table corte2.empleados(
	identificacion varchar primary key,
	nombre varchar,
	edad int,
	correo varchar,
	salario numeric
);

 create table corte2.nominas(
 	id serial primary key,
 	fecha date,
 	total_ingresos numeric,
 	total_deducciones numeric,
 	total_neto numeric,
 	empleado_id varchar,
 	foreign key (empleado_id) references empleados(identificacion)
 );
 
create table corte2.detalle_nominas(
	id serial primary key,
	concepto varchar,
	tipo varchar,
	valor numeric,
	nomina_id integer,
	foreign key (nomina_id) references nominas(id)
);

create table corte2.auditoria_nomina(
 	id serial primary key,
 	fecha date,
 	total_neto numeric,
 	nombre varchar,
 	identificacion varchar
 );

create table corte2.auditoria_empleado(
 	id serial primary key,
 	fecha date,
 	valor numeric,
 	nombre varchar,
 	identificacion varchar,
 	concepto varchar
 );

create or replace function corte2.verificar_presupuesto_nomina()
returns trigger as
$$
declare
	v_presupuesto_usado numeric := 0;
	v_salario numeric;
	v_total_neto numeric;
begin
	for v_total_neto in 
		select total_neto from corte2.nominas where extract(month from fecha) = extract(month from new.fecha)
	loop
		v_presupuesto_usado := v_presupuesto_usado + v_total_neto;
	end loop;
	
	v_presupuesto_usado := v_presupuesto_usado + new.total_neto;	

	if	v_presupuesto_usado > 12000000 then
		raise exception 'PRESUPUESTO MENSUAL SUPERADO';
	end if;
	return new;
end;
$$
language plpgsql;

create trigger tg_verificar_presupuesto_nomina
before insert on corte2.nominas 
for each row execute procedure corte2.verificar_presupuesto_nomina()


insert into corte2.empleados(identificacion, nombre, edad, correo, salario)
values('2134234', 'vic', 21, 'test@gmail.com', 120400);
insert into corte2.empleados(identificacion, nombre, edad, correo, salario)
values('234234', 'juan', 22, 'test2@gmail.com', 120540);
insert into corte2.empleados(identificacion, nombre, edad, correo, salario)
values('234324', 'joe', 26, 'test3@gmail.com', 160006);
    

insert into corte2.nominas(fecha, total_ingresos, total_deducciones, 	total_neto, empleado_id)
values('2024-10-05', 2000000, 2, 120, '2134234');



create or replace function corte2.generar_auditoria_nomina()
returns trigger as
$$
declare
	v_nombre_empleado varchar;
begin
	
	select e.nombre into v_nombre_empleado
	from corte2.empleados e
	where e.identificacion = new.empleado_id;
	
	insert into corte2.auditoria_nomina(fecha, total_neto, nombre, identificacion)
	values (new.fecha, new.total_neto , v_nombre_empleado , new.empleado_id);
	return new;
end;
$$
language plpgsql;

create trigger tg_generar_auditoria_nomina
after insert on corte2.nominas 
for each row execute procedure corte2.generar_auditoria_nomina();

insert into corte2.nominas(fecha, total_ingresos, total_deducciones, total_neto, empleado_id)
values('2024-10-05', 1000, 10, 990, '567');

create or replace function corte2.verificar_presupuesto_salario()
returns trigger as
$$
declare
	v_presupuesto_usado numeric := 0;
	v_salario numeric;
begin
	for v_salario in 
		select salario from corte2.empleados where identificacion != old.identificacion
	loop
		v_presupuesto_usado := v_presupuesto_usado + v_salario;
	end loop;
	
	v_presupuesto_usado := v_presupuesto_usado + new.salario;	

	if	v_presupuesto_usado > 12000000 then
		raise exception 'PRESUPUESTO MENSUAL SUPERADO';
	end if;
	return new;
end;
$$
language plpgsql;


create trigger tg_verificar_presupuesto_salario
before update on corte2.empleados 
for each row execute procedure corte2.verificar_presupuesto_salario()

update empleados set salario = 180000 where identificacion = '2134234';
update empleados set salario = 670000 where identificacion = '234234';



create or replace function corte2.generar_auditoria_empleado()
returns trigger as
$$
declare
	v_concepto varchar;
	v_valor numeric;
begin
	
	if old.salario < new.salario  then
		v_concepto := 'AUMENTO';
		v_valor := new.salario - old.salario;
	else
		v_concepto := 'DISMINUCION';
		v_valor := old.salario - new.salario;
	end if;
	
	insert into corte2.auditoria_empleado(fecha, valor, nombre, identificacion, concepto)
	values (now(), v_valor , old.nombre , old.identificacion, v_concepto);
	return new;
end;
$$
language plpgsql;

create trigger tg_generar_auditoria_empleado
after update on corte2.empleados 
for each row execute procedure corte2.generar_auditoria_empleado();



update empleados set salario = 170000 where identificacion = '2134234';
update empleados set salario = 680000 where identificacion = '234234';
