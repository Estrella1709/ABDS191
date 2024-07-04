CREATE PROCEDURE sp_InsertarPeliculaConHistorial
    @Titulo NVARCHAR(100),
    @Genero NVARCHAR(50),
    @FechaEstreno DATE,
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @PeliculaID INT;

        INSERT INTO Peliculas (Titulo, Genero, FechaEstreno)
        VALUES (@Titulo, @Genero, @FechaEstreno);

        SET @PeliculaID = SCOPE_IDENTITY();

        INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion)
        VALUES (@UsuarioID, @PeliculaID, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
		DECLARE @ErrorMessage NVARCHAR(4000)
		SET @ErrorMessage = ERROR_MESSAGE ();
		PRINT @ErrorMessage
    END CATCH;
END;

EXEC sp_InsertarPeliculaConHistorial 
    'Intensamente',
    'Infantil',
    '2015-06-19',
    4;

SELECT * FROM Peliculas
SELECT * FROM HistorialVisualizacion

CREATE PROCEDURE sp_InsertarUsuarioSuscripcionVisualizacion
    @Nombre NVARCHAR(100),
    @Email NVARCHAR(100),
    @Pass NVARCHAR(100),
    @FechaRegistro DATE,
    @FechaInicioSuscripcion DATE,
    @FechaFinSuscripcion DATE,
    @TipoSuscripcion NVARCHAR(50),
    @PeliculaID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @UsuarioID INT, @SuscripcionID INT;

        INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro)
        VALUES (@Nombre, @Email, @Pass, @FechaRegistro);

        SET @UsuarioID = SCOPE_IDENTITY();

        INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo)
        VALUES (@UsuarioID, @FechaInicioSuscripcion, @FechaFinSuscripcion, @TipoSuscripcion);

        INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion)
        VALUES (@UsuarioID, @PeliculaID, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
		DECLARE @ErrorMessage NVARCHAR(4000)
		SET @ErrorMessage = ERROR_MESSAGE ();
		PRINT @ErrorMessage
    END CATCH;
END;

EXEC sp_InsertarUsuarioSuscripcionVisualizacion 
    'Juan Pérez',
    'juan.perez@example.com',
    'password123',
    '2024-07-03',
    '2024-07-03',
    '2025-07-03',
    'Mensual',
    1;


SELECT * FROM Suscripciones
SELECT * FROM HistorialVisualizacion



CREATE PROCEDURE sp_ActualizarCorreoYSuscripcion
    @UsuarioID INT,
    @NuevoEmail NVARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        UPDATE Usuarios
        SET Email = @NuevoEmail
        WHERE UsuarioID = @UsuarioID;

        UPDATE Suscripciones
        SET Tipo = 'Anual'
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
		DECLARE @ErrorMessage NVARCHAR(4000)
		SET @ErrorMessage = ERROR_MESSAGE ();
		PRINT @ErrorMessage
    END CATCH;
END;

EXEC sp_ActualizarCorreoYSuscripcion 
    1,
    'nuevo.email@example.com';

SELECT * FROM Usuarios
SELECT * FROM Suscripciones



CREATE PROCEDURE EliminarPeliculaYHistorial
    @PeliculaID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        DELETE FROM HistorialVisualizacion
        WHERE PeliculaID = @PeliculaID;

        DELETE FROM Peliculas
        WHERE PeliculaID = @PeliculaID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
		DECLARE @ErrorMessage NVARCHAR(4000)
		SET @ErrorMessage = ERROR_MESSAGE ();
		PRINT @ErrorMessage
    END CATCH;
END;

EXEC EliminarPeliculaYHistorial 
    1;

SELECT * FROM Peliculas
SELECT * FROM HistorialVisualizacion


CREATE PROCEDURE sp_EliminarUsuarioConSuscripcionesHistorial
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
		DECLARE @ErrorMessage NVARCHAR(4000)
		SET @ErrorMessage = ERROR_MESSAGE ();
		PRINT @ErrorMessage
    END CATCH;
END;

EXEC sp_EliminarUsuarioConSuscripcionesHistorial 
    1;

SELECT * FROM Usuarios
SELECT * FROM Suscripciones
SELECT * FROM HistorialVisualizacion