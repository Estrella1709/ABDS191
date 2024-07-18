-- Crear la tabla de auditoría para registrar eventos DDL
CREATE TABLE AuditoriaDDL (
    EventoID INT IDENTITY(1,1) PRIMARY KEY,
    TipoEvento NVARCHAR(100),
    TiempoEvento DATETIME,
    DatosEvento NVARCHAR(MAX)
);

-- Crear el trigger DDL1 Que registra una creacion de una tabla
CREATE TRIGGER RegistroCreacionTabla
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
    INSERT INTO AuditoriaDDL (TipoEvento, TiempoEvento, DatosEvento)
    VALUES ('CREATE_TABLE', GETDATE(), EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'));
END;
GO

--Ejmplo
CREATE TABLE EjemploTabla (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(100)
);

SELECT * FROM AuditoriaDDL

-- Crear el trigger DDL2 que registra una alteración a una tabla
CREATE TRIGGER RegistroAlteracionTabla
ON DATABASE
AFTER ALTER_TABLE
AS
BEGIN
    INSERT INTO AuditoriaDDL (TipoEvento, TiempoEvento, DatosEvento)
    VALUES ('ALTER_TABLE', GETDATE(), EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'));
END;
GO

--Ejemplo
ALTER TABLE EjemploTabla
ADD Apellido NVARCHAR(100);


-- Crear el trigger DML1 Prevención de eliminación en la tabla de historial de visualización
CREATE TRIGGER PrevenirEliminacionHistorialVisualizacion
ON HistorialVisualizacion
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'No se permite la eliminación de registros en la tabla HistorialVisualizacion.';
END;
GO

--Ejemplo
DELETE FROM HistorialVisualizacion WHERE UsuarioID = 1;

-- Crear la tabla de Auditoría de inserciones en la tabla de historial de visualización
CREATE TABLE AuditoriaDML (
    EventoID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    PeliculaID INT,
    FechaVisualizacion DATETIME,
    TiempoEvento DATETIME
);

-- Crear el trigger DML 2 
CREATE TRIGGER AuditoriaInsercionHistorialVisualizacion
ON HistorialVisualizacion
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaDML (UsuarioID, PeliculaID, FechaVisualizacion, TiempoEvento)
    SELECT UsuarioID, PeliculaID, FechaVisualizacion, GETDATE()
    FROM inserted;
END;
GO

--Ejemplo
INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion)
VALUES (10, 11, GETDATE());

SELECT * FROM HistorialVisualizacion
SELECT * FROM AuditoriaDML