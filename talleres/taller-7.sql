CREATE TABLE clientes (
    identificacion VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(30),
    edad NUMBER,
    correo VARCHAR2(255)
);

CREATE TABLE productos (
    codigo VARCHAR2(13) PRIMARY KEY,
    nombre VARCHAR2(60) NOT NULL,
    stock NUMBER NOT NULL,
    valor_unitario NUMBER NOT NULL
);

CREATE TYPE pedido_estado IS VARCHAR2(20) CHECK (VALUE IN ('PENDIENTE', 'BLOQUEADO', 'ENTREGADO'));

CREATE TABLE facturas (
    id NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1 PRIMARY KEY,
    fecha DATE NOT NULL,
    cantidad NUMBER NOT NULL,
    valor_total NUMBER NOT NULL,
    pedido_estado pedido_estado NOT NULL,
    producto_id VARCHAR2(13),
    cliente_id VARCHAR2(9),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES productos(codigo),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(identificacion)
);

CREATE OR REPLACE PROCEDURE verificar_stock(p_producto_id IN varchar(13), p_cantidad_compra IN NUMBER)
IS 
	v_stock NUMBER := 0;
BEGIN 
	SELECT stock IN v_stock FROM productos WHERE codigo = p_producto_id;
	IF v_stock > p_cantidad_compra THEN
      DBMS_OUTPUT.PUT_LINE('hay stock');
   ELSE
      DBMS_OUTPUT.PUT_LINE('no hay stock');
   END IF;
END;
