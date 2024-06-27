/*Insertar usuarios*/
CREATE PROCEDURE sp_InsertarUsuarios
	@Nombre NVARCHAR (100),
	@Email NVARCHAR (100),
	@Pass NVARCHAR (100),
	@FechaRegistro DATE
AS
BEGIN
	INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro)
	VALUES(@Nombre, @Email, @Pass, @FechaRegistro)
END

EXEC sp_InsertarUsuarios @Nombre='Estrellita',@Email='estrellita17@example.com',@Pass='vebdwer23',@FechaRegistro='2023-09-17'
EXEC sp_InsertarUsuarios @Nombre='Isay',@Email='isay.guerra@example.com',@Pass='bdertu2',@FechaRegistro='2023-05-21'
EXEC sp_InsertarUsuarios @Nombre='Kath',@Email='kath.noir@example.com',@Pass='vivagenshin123pro',@FechaRegistro='2024-06-26'

SELECT * FROM Usuarios

/*Editar suscripcion*/
CREATE PROCEDURE sp_EditarSuscripcion
	@ID INT,
	@FechaInicio DATE,
	@FechaFin DATE,
	@Tipo NVARCHAR (50)
AS
BEGIN
	UPDATE Suscripciones
    SET FechaInicio = @FechaInicio,
        FechaFin = ISNULL(@FechaFin, FechaFin),
        Tipo = ISNULL(@Tipo, Tipo)
    WHERE SuscripcionID = @ID
END

EXEC sp_EditarSuscripcion @ID = 1, @FechaInicio= '2024-05-26',@FechaFin= '2024-06-26', @Tipo= 'Mensual' 
EXEC sp_EditarSuscripcion @ID = 2, @FechaInicio= '2023-08-28',@FechaFin= '2024-08-28', @Tipo= 'Anual' 
EXEC sp_EditarSuscripcion @ID = 3, @FechaInicio= '2023-05-13',@FechaFin= '2024-05-13', @Tipo= 'Anual' 

SELECT * FROM Suscripciones


/*Eliminar historial*/
CREATE PROCEDURE sp_EliminarHistorial
	@HistorialID INT
AS
BEGIN
    DELETE FROM HistorialVisualizacion
    WHERE HistorialID = @HistorialID;
END

EXEC sp_EliminarHistorial @HistorialID = 2
EXEC sp_EliminarHistorial @HistorialID = 4
EXEC sp_EliminarHistorial @HistorialID = 3

SELECT * FROM HistorialVisualizacion

/* Consultar usuario por tipo de suscripción*/ 

CREATE PROCEDURE sp_UsuarioTipoSuscripcion
	@Tipo NVARCHAR(50)

AS
BEGIN
    SELECT u.UsuarioID, u.Nombre, s.FechaInicio, s.FechaFin, s.Tipo AS 'Tipo de suscripción'
    FROM Usuarios u
    INNER JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
    WHERE s.Tipo = @Tipo;
END

EXEC sp_UsuarioTipoSuscripcion @Tipo = 'Anual'
EXEC sp_UsuarioTipoSuscripcion @Tipo = 'Mensual'
	