SELECT * FROM Clientes

--Mensaje despues de insertar un nuevo cliente
CREATE TRIGGER trg_MensajeAlInsertarCliente
ON Clientes
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha insertado un nuevo cliente.'
END

--Ejemplos
INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) 
VALUES ('Luis Gomez', 'Calle Nueva 789, Ciudad', '555-3344', 'luis.gomez@example.com');

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) 
VALUES ('Elena Rodriguez', 'Av. Central 234, Ciudad', '555-5566', 'elena.rodriguez@example.com');



--Mensaje despues de eliminar un cliente
CREATE TRIGGER trg_MenajeAlEliminarCliente
ON Clientes
AFTER DELETE
AS
BEGIN
    PRINT 'Se ha eliminado un cliente.'
END

--Ejemplo
DELETE FROM Clientes WHERE ClienteID = 13;



--Validación de cuenta existente si el cliente existe o no
CREATE TRIGGER trg_ValidacionDeCuenta
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ClienteID INT;
    SELECT @ClienteID = ClienteID FROM INSERTED;

    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = @ClienteID)
    BEGIN
        PRINT 'No se puede crear la cuenta. El cliente no existe.';
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
        SELECT ClienteID, TipoCuenta, Saldo, FechaApertura FROM INSERTED;
        PRINT 'Cuenta creada exitosamente.';
    END
END

--Ejemplo de que la cuenta es creada exitosamente
INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) 
VALUES (11, 'Ahorro', 2000.00, '2023-05-01');

--Ejemplo de que el cliente no existe
INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) 
VALUES (999, 'Corriente', 1500.00, '2023-05-02');



--Evitar actualizaciones con saldo negativo en la tabla cuentas
CREATE TRIGGER trg_ValidacionDeSaldo
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM INSERTED WHERE Saldo < 0)
    BEGIN
        PRINT 'No se permite ingresar un saldo negativo.';
    END
    ELSE
    BEGIN
        UPDATE Cuentas
        SET ClienteID = INSERTED.ClienteID,
            TipoCuenta = INSERTED.TipoCuenta,
            Saldo = INSERTED.Saldo,
            FechaApertura = INSERTED.FechaApertura
        FROM INSERTED
        WHERE Cuentas.CuentaID = INSERTED.CuentaID;
    END
END

--Ejemplo de actualización de saldo
UPDATE Cuentas 
SET Saldo = 5000.00 
WHERE CuentaID = 1;

--Ejemplo de actualización de saldo no permitido por ser negativo
UPDATE Cuentas 
SET Saldo = -1000.00 
WHERE CuentaID = 3;


--Validación para no permitir eliminar préstamos si tienen pagos asociados
CREATE TRIGGER trg_ValidacionDeEliminarPagos
ON Prestamos
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM PagosPrestamos WHERE PrestamoID IN (SELECT PrestamoID FROM DELETED))
    BEGIN
        PRINT 'No se puede eliminar el préstamo. Existen pagos asociados.';
    END
    ELSE
    BEGIN
        DELETE FROM Prestamos WHERE PrestamoID IN (SELECT PrestamoID FROM DELETED);
        PRINT 'Préstamo eliminado exitosamente.';
    END
END

Select*from Prestamos

--Ejemplo
DELETE FROM Prestamos WHERE PrestamoID = 1;

--Creación de tabla para el trigger
CREATE TABLE logClientes (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Operacion NVARCHAR(10),
    FechaHora DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER trg_LogCliente
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operacion NVARCHAR(10);

    -- Determina el tipo de operación realizada
    IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @Operacion = 'UPDATE';
    END
    ELSE IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        SET @Operacion = 'INSERT';
    END
    ELSE IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @Operacion = 'DELETE';
    END

    -- Inserta el registro en logClientes
    INSERT INTO logClientes (Operacion)
    VALUES (@Operacion);
END;

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) 
VALUES ('Francisco Ortega', 'Calle del Río 123, Ciudad', '555-1234', 'francisco.ortega@example.com');

select * from logClientes

UPDATE Clientes 
SET Email = 'maria.lopez.nuevo@example.com' 
WHERE ClienteID = 2;
