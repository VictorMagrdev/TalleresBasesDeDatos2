
~~~SQL
CREATE OR REPLACE PROCEDURE nombre_procedimiento(parametro1 tipo_dato,...)
LANGUAGE plpgsql
AS $$
DECLARE
	-- Declaracion de variables locales
BEGIN
	-- Cuerpo del procedimiento
	-- sentencias SQL y comandos del control de flujo
END;
$$;
~~~

ejemplo:
~~~SQL
CREATE OR REPLACE PROCEDURE transferir_dinero(
	p_cuenta_origen INTEGER,
	P_cuenta_destino INTEGER,
	p_monto NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_saldo_origen NUMERIC;
	v_saldo_destino NUMERIC;
BEGIN
	-- obtenemos los saldos actuales de las cuentas
	SELECT saldo INTO v_saldo_origen FROM cuentas WHERE id = p_cuenta_origen;
	SELECT saldo INTO v_saldo_destino FROM cuentas WHERE id = p_cuenta_destino;

	-- realizamos la transferencia
	UPDATE cuentas SET saldo = saldo - p_monto WHERE id = p_cuenta_origen;
	UPDATE cuentas SET saldo = saldo + p_monto WHERE id = p_cuenta_destino;
END;
$$;
~~~

~~~sql
IF condicion THEN
	-- sentencias a ejecutar si la condicion es verdadera
ELSEIF condicion THEN
	-- sentencia a ejecutar si la condicion 2 es verdadera
ELSE
	--- sentencia a ejecutar si ninguna condicion es verdadera
END IF;

DECLARE
	edad INTEGER := 25;
BEGIN
	IF edad >= 18 THEN
		RAISE NOTICE 'eres mayor de edad';
	ELSE
		RAISE NOTICE 'eres menor de edad';
	END IF;
END;

CASE
	WHEN condicion THEN
		-- sentencias a ejecutar si la condicion es verdadera
	WHEN condicion THEN
		-- sentencias a ejecutar si la condicion es verdadera
	ELSE
		-- sentencias a ejecutar si ninguna condicion es verdadera
END CASE;

DECLARE
	calificacion INTEGER := 85;
BEGIN
	CASE WHEN calificacion >= 90 THEN
		RAISE NOTICE 'excelente';
	WHEN calificacion >= 80 THEN
		RAISE NOTICE 'bueno';
	ELSE
		RAISE NOTICE 'malo';
	END CASE;
		
		
~~~
LOOP
~~~sql
LOOP
	--sentecias a ejecutar repetidamente
	EXIT WHEN condicion;
END LOOP;

DECLARE
	i INTEGER := 1;
BEGIN
	LOOP
		RAISE NOTICE '%',i;
		EXIT WHEN i >10;
	END LOOP;
END;

WHILE condicion LOOP
	--sentecias a ejecutar repetidamente
END LOOP;

DECLARE
	i INTEGER :=1;
BEGIN
	WHILE i<= 10 LOOP
		RAISE NOTICE '%', i;
		i := i + 1;
	END LOOP;
END;

FOR variable IN inicio..fin LOOP
	--sentecias a ejecutar repetidamente
END LOOP;

FOR i IN 1..5 LOOP
	RAISE NOTICE '%',i;
END LOOP;
~~~

~~~sql
CREATE FUNCTION nombre_function(parametro1 tipo_dato, parametro2 tipo_dato)
RETURNS tipo_retorno AS
$$
-- cuerpo de la funcion en PL/pgSQL
$$
LANGUAGE plpgsql;
~~~

~~~sql
CREATE FUNCTION calcular_area_circulo(p_radio numeric)
RETURNS numeric AS
$$
	DECLARE 
	v_area numeric;
	begin
		v_area := 3.1416 * radio *radio;
	return v_area;
	end
$$
LANGUAGE plpgsql;
~~~
