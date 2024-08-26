create table cuentas(
	id SERIAL primary key,
	saldo numeric
);

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

	RAISE NOTICE 'Saldo origen: %', v_saldo_origen;
    RAISE NOTICE 'Saldo destino: %', v_saldo_destino;

	-- realizamos la transferencia
	UPDATE cuentas SET saldo = saldo - p_monto WHERE id = p_cuenta_origen;
	UPDATE cuentas SET saldo = saldo + p_monto WHERE id = p_cuenta_destino;
END;
$$;

insert into cuentas(id, saldo) values(123456789, 2000);
insert into cuentas(id, saldo) values(981928329, 5000);
insert into cuentas(id, saldo) values(123249882, 8000);
insert into cuentas(id, saldo) values(122432467, 1000);
insert into cuentas(id, saldo) values(123402399, 200);

select * from cuentas;

call transferir_dinero(123456789,981928329, 500);
select * from cuentas;

CREATE OR REPLACE PROCEDURE crear_cuenta(
	p_numero_cuenta INTEGER,
	p_saldo_cuenta NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
	insert into cuentas(id, saldo) values(p_numero_cuenta, p_saldo_cuenta);
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_cuenta(
	p_numero_cuenta INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	delete from cuentas where id = p_numero_cuenta;
END;
$$;

call crear_cuenta(1232763847,600);
call eliminar_cuenta(1232763847);
