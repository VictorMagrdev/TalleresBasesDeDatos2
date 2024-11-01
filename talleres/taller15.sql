create table facturas (
    id SERIAL primary key,
    factura_descripcion JSONB
);

create or replace
procedure guardar_factura(json_datos JSONB)
language plpgsql
as $$
begin
	if (json_datos->>'total_factura')::numeric <= 10000
and (json_datos->>'total_descuento')::numeric <= 50 then

        insert
	into
	facturas(factura_descripcion)
values (json_datos);
end if;
end;

$$;

create or replace
procedure update_factura(json_datos jsonb,
p_codigo text)
language plpgsql
as $$
 	declare
	v_id int;

begin
	select
	id
into
	v_id
from
	facturas
where
	factura_descripcion->>'codigo' = p_codigo;

update
	corte2.facturas
set
	factura_descripcion = json_datos
where
	id = v_id;
end;

$$

create or replace
function obtener_nombre(p_identificacion text) returns text
language plpgsql
as $$
declare 
	v_nombre text;

begin
	select
	factura_descripcion->> 'cliente' as cliente
into
	v_nombre
from
	facturas
where
	factura_descripcion->>'identificacion' = p_identificacion;

return v_nombre;
end;

$$

create or replace
function obtener_facturas() 
returns jsonb
as $$
declare
    facturas_json jsonb;

begin
    select
	jsonb_agg(
        jsonb_build_object(
            'cliente',
	factura_descripcion->'cliente',
	'identificacion',
	factura_descripcion->'identificacion',
	'codigo',
	factura_descripcion->'codigo',
	'total_descuento',
	factura_descripcion->'total_descuento',
	'total_factura',
	factura_descripcion->'total_factura'
        )
    )
    into
	facturas_json
from
	facturas;

return facturas_json;
end;

$$
language plpgsql;


create or replace
function obtener_productos_por_codigo_factura(p_codigo_factura VARCHAR)
returns table (
    c_nombre VARCHAR,
    c_descripcion VARCHAR,
    c_precio numeric,
    c_cantidad INT,
    c_valor numeric
)
language plpgsql
as $$
begin
    return QUERY
    select
	(p->'producto'->>'nombre')::VARCHAR as c_nombre,
	(p->'producto'->>'descripcion')::VARCHAR as c_descripcion,
	(p->'producto'->>'precio')::numeric as c_precio,
	(p->>'cantidad')::INT as c_cantidad,
	(p->>'valor')::numeric as c_valor
from
	facturas f,
	jsonb_array_elements(f.factura_descripcion->'productos') as p
where
	f.factura_descripcion->>'codigo' = p_codigo_factura;
end;

$$;

call guardar_factura(
    '{
        "cliente": "Juan Pérez",
        "identificacion": "123456789",
        "direccion": "Calle Falsa 123",
        "codigo": "FAC-001",
        "total_descuento": "30",
        "total_factura": "5000",
        "productos": [
            {
                "cantidad": 2,
                "valor": 1000.0,
                "producto": {
                    "nombre": "Laptop",
                    "descripcion": "Laptop de 15 pulgadas",
                    "precio": 500.0,
                    "categorias": ["Tecnología", "Computadoras", "Electrónica"]
                }
            },
            {
                "cantidad": 1,
                "valor": 2000.0,
                "producto": {
                    "nombre": "Impresora",
                    "descripcion": "Impresora a color",
                    "precio": 2000.0,
                    "categorias": ["Oficina", "Electrónica"]
                }
            }
        ]
    }'::jsonb
);

call update_factura(
    '{
        "cliente": "Juan Pérez",
        "identificacion": "123456789",
        "direccion": "Calle Falsa 123",
        "codigo": "FAC-001",
        "total_descuento": "50",
        "total_factura": "8000",
        "productos": [
            {
                "cantidad": 3,
                "valor": 1500.0,
                "producto": {
                    "nombre": "Laptop",
                    "descripcion": "Laptop de 15 pulgadas",
                    "precio": 500.0,
                    "categorias": ["Tecnología", "Computadoras", "Electrónica"]
                }
            },
            {
                "cantidad": 1,
                "valor": 2000.0,
                "producto": {
                    "nombre": "Impresora",
                    "descripcion": "Impresora a color",
                    "precio": 2000.0,
                    "categorias": ["Oficina", "Electrónica"]
                }
            }
        ]
    }'::jsonb,
    'FAC-001'
);

select
	*
from
	obtener_nombre('123456789');

select
	*
from
	obtener_facturas();

select
	*
from
	obtener_productos_por_codigo_factura('FAC-001');
