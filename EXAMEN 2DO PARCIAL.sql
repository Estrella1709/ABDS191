CREATE DATABASE DBBank;

USE DBBank;


CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);
CREATE TABLE Cuentas (
    CuentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(18, 2),
    FechaApertura DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    CuentaID INT,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);
CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Posicion NVARCHAR(50),
    Departamento NVARCHAR(50),
    FechaContratacion DATE
);


INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES 
('Juan Pérez', 'Av. Siempre Viva 123, Ciudad', '555-1234', 'juan.perez@example.com'),
('María López', 'Calle Falsa 456, Ciudad', '555-5678', 'maria.lopez@example.com'),
('Carlos García', 'Boulevard Central 789, Ciudad', '555-9101', 'carlos.garcia@example.com'),
('Ana Fernández', 'Av. de la Paz 321, Ciudad', '555-1122', 'ana.fernandez@example.com');

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES 
(1, 'Ahorro', 1500.00, '2023-01-15'),
(2, 'Corriente', 2500.00, '2023-02-20'),
(3, 'Ahorro', 3000.00, '2023-03-10'),
(4, 'Corriente', 4000.00, '2023-04-25');

INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion) VALUES 
(1, 'Deposito', 500.00, '2023-01-16 10:00:00'),
(2, 'Retiro', 200.00, '2023-02-21 14:30:00'),
(3, 'Deposito', 300.00, '2023-03-11 09:00:00'),
(4, 'Retiro', 400.00, '2023-04-26 16:45:00');

INSERT INTO Empleados (Nombre, Posicion, Departamento, FechaContratacion) VALUES 
('Laura Martínez', 'Gerente', 'Administración', '2020-05-15'),
('Pedro Gómez', 'Analista', 'Finanzas', '2021-06-20'),
('Sofía Ruiz', 'Desarrollador', 'Tecnología', '2022-07-25'),
('Miguel Torres', 'Soporte', 'Atención al Cliente', '2023-08-30');

SELECT * FROM Clientes
SELECT * FROM Cuentas
SELECT * FROM Transacciones
SELECT * FROM Empleados


CREATE PROCEDURE sp_InsertNuevoEmpleado
		@Nombre NVARCHAR(100),
		@Posicion NVARCHAR(50),
		@Departamento NVARCHAR(50),
		@FechaContratacion DATE
AS
BEGIN

	INSERT INTO Empleados (Nombre, Posicion, Departamento, FechaContratacion) VALUES 
	(@Nombre, @Posicion, @Departamento, @FechaContratacion);

END

EXEC sp_InsertNuevoEmpleado 'Estrella', 'Desarrollador', 'Tecnología', '2024-07-10';

CREATE PROCEDURE sp_NuevaCuentaDeposito
	@Nombre NVARCHAR(100),
	@Direccion NVARCHAR(200),
	@Telefono NVARCHAR (15),
	@Email NVARCHAR (100)

AS
BEGIN
	BEGIN TRY

	INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES
	(@Nombre, @Direccion, @Telefono, @Email);

	DECLARE @nuevo_cliente BIGINT;
    SELECT @nuevo_cliente = SCOPE_IDENTITY();

	INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES 
	(@nuevo_cliente,'Ahorro','1500.00', '2024-07-10');

	DECLARE @nueva_Cuenta BIGINT;
	SELECT @nueva_Cuenta = SCOPE_IDENTITY();

	INSERT INTO Transacciones ( CuentaID, TipoTransaccion, Monto, FechaTransaccion) VALUES 
	(@nueva_Cuenta, 'Deposito', '1500.00', '2024-07-10 18:38:00');

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
        THROW;
	END CATCH	
END

EXEC sp_NuevaCuentaDeposito 'Pablo Aguillon', 'Av 1 Col Tonatiuh, Ciudad Qro', '4444-123456', 'pablo.aguillon@example.com';
select * from Clientes
select * from Cuentas
select * from Transacciones

