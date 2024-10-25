CREATE TABLE facturas (
    id SERIAL PRIMARY KEY,
    factura_descripcion JSONB
);

CREATE OR REPLACE PROCEDURE guardar_factura(json_datos JSONB)
LANGUAGE plpgsql
AS $$
BEGIN
	IF (json_datos->>'total_factura')::numeric <= 10000 AND (json_datos->>'total_descuento')::numeric <= 50 THEN

        INSERT INTO facturas(factura_descripcion) VALUES (json_datos);
    END IF;
END;
$$;

create or replace procedure update_factura(json_datos jsonb,p_codigo text)
language plpgsql
as $$
 	declare
	v_id int;
begin
	select id into v_id from facturas where factura_descripcion->>'codigo' = p_codigo;
	update corte2.facturas set factura_descripcion = json_datos where id = v_id;

end;
$$

create or replace function obtener_nombre(p_identificacion text) returns text
language plpgsql
as $$
declare 
	v_nombre text;
begin
	select factura_descripcion->> 'cliente' as cliente into v_nombre from facturas where factura_descripcion->>'identificacion' = p_identificacion;
	return v_nombre;
end;
$$

CREATE OR REPLACE FUNCTION obtener_facturas() 
RETURNS jsonb
AS $$
DECLARE
    facturas_json jsonb;
BEGIN
    SELECT jsonb_agg(
        jsonb_build_object(
            'cliente', factura_descripcion->'cliente',
            'identificacion', factura_descripcion->'identificacion',
            'codigo', factura_descripcion->'codigo',
            'total_descuento', factura_descripcion->'total_descuento',
            'total_factura', factura_descripcion->'total_factura'
        )
    )
    INTO facturas_json FROM facturas;
    
    RETURN facturas_json;
END;
$$
LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION obtener_productos_por_codigo_factura(p_codigo_factura VARCHAR)
RETURNS TABLE (
    c_nombre VARCHAR,
    c_descripcion VARCHAR,
    c_precio NUMERIC,
    c_cantidad INT,
    c_valor NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        (p->'producto'->>'nombre')::VARCHAR AS c_nombre,
        (p->'producto'->>'descripcion')::VARCHAR AS c_descripcion,
        (p->'producto'->>'precio')::NUMERIC AS c_precio,
        (p->>'cantidad')::INT AS c_cantidad,
        (p->>'valor')::NUMERIC AS c_valor
    FROM facturas f,
    jsonb_array_elements(f.factura_descripcion->'productos') AS p
    WHERE f.factura_descripcion->>'codigo' = p_codigo_factura;
END;
$$;

CALL guardar_factura(
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

CALL update_factura(
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

SELECT * from obtener_nombre('123456789');

select * from obtener_facturas();

SELECT * from obtener_productos_por_codigo_factura('FAC-001');
