es una unidad de trabajo atómica, que garantiza la integridad de los datos. es una secuencia de operaciones de base de datos que se ejecutan como un todo invisible.
### caracteristicas
- **atomicidad**: una transacción se ejecuta como una sola unidad de trabajo. No puede dividirse en partes mas pequeñas
- **consistencia**: 
- **aislamiento**
- **durabilidad**
### importancia
- **integridad de los datos**
- **recuperación de errores**
- **concurrencia**
### comandos para la gestión de transacciones
- **BEGIN**: Inicia una nueva transacción
- **COMMIT**: confirma los cambios realizados en la transacción, haciendo que sean permanentes
- **ROLLBACK**: deshace todos los cambios realizados en la transacción, volviendo la base de datos a su estado anterior.
- **SAVEPOINT**: Establece un punto de restauración dentro de una transacción.
- **ROLLBACK TO SAVEPOINT**: deshace los cambios realizados desde un punto de restauración especifico
~~~SQL
BEGIN;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
COMMIT;
~~~

~~~SQL
BEGIN;
INSERT INTO productos (nombre, precio) VALUES ('Telefono')
~~~