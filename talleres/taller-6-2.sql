create table clientes(
	id SERIAL primary key,
	identificacion varchar(9) unique,
	nombre varchar(30),
	email varchar(255),
	direccion varchar(255),
	telefono varchar(13)
);

create table servicios (
	id SERIAL primary key,
	codigo varchar(13) unique,
	tipo varchar(24),
	monto float not null,
	cuota float not null,
	intereses float not null,
	valor_total float not null,
	cliente_id int not null,
	foreign key(cliente_id) references clientes(id)
);

CREATE TYPE estado AS ENUM('pago','no_pago','pendiente_pago');

create table pagos (
	id serial primary key,
	codigo_transaccion varchar(80),
	fecha_pago date not null,
	total float not null,
	estado ESTADO,
	servicion_id int not null,
	foreign key(servicion_id) references servicios(id)
);
create or replace procedure poblar_database_clientes()
language plpgsql
as $$
declare
    v_cliente_identificacion varchar(9);
    v_cliente_nombre varchar(30);
    v_cliente_email varchar(255);
    v_cliente_telefono varchar(13);
    v_servicios_codigo varchar(13);
    v_servicios_cliente_id int;
    v_servicios_id int;
    v_servicios_monto float;
    v_servicios_cuota float;
    v_servicios_intereses float;
    v_servicios_valor_total float;
    v_pagos_codigo_transaccion varchar(80);
    v_pagos_codigo_total float;
    v_pagos_codigo_servicion_id int;
begin
    for i in 1..50 loop
        v_cliente_nombre := 'carlos_' || i;
        v_cliente_email := v_cliente_nombre || '@gmail.com';
        v_cliente_identificacion := (floor(random() * 900000000 + 100000000)::bigint)::text;
        v_cliente_telefono := (floor(random() * 900000000 + 100000000)::bigint)::text;
        insert into clientes (identificacion, nombre, email, direccion, telefono) values (v_cliente_identificacion, v_cliente_nombre, v_cliente_email, 'xxxxxxx', v_cliente_telefono);
        select id into v_servicios_cliente_id from clientes where identificacion = v_cliente_identificacion;
        for j in 1..3 loop
            v_servicios_codigo := (floor(random() * 900000000 + 100000000)::bigint)::text;
            v_servicios_monto := 1 + random() * 2000000;
            v_servicios_cuota := 1 + random() * 2000000;
            v_servicios_intereses := 1 + random() * 2000000;
            v_servicios_valor_total := 1 + random() * 2000000;
            insert into servicios (codigo, tipo, monto, cuota, intereses, valor_total, cliente_id) values (v_servicios_codigo, 'venta', v_servicios_monto, v_servicios_cuota, v_servicios_intereses, v_servicios_valor_total, v_servicios_cliente_id);
            select id into v_servicios_id from servicios where codigo = v_servicios_codigo;
            for k in 1..3 loop
                v_pagos_codigo_transaccion := 'ct-' || floor(random() * 9000000000 + 1000000000)::bigint;
                v_pagos_codigo_total := 1 + random() * 2000;
                insert into pagos (codigo_transaccion, fecha_pago, total, estado, servicion_id) values (v_pagos_codigo_transaccion, '2024-09-01', v_pagos_codigo_total, 'pago', v_servicios_id);
            end loop;
        end loop;
    end loop;
end;
$$;
call poblar_database_clientes();

