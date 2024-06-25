

-- Sintaxis para procesar un procedimiento

EXEC sp_helpdb

--Explora las propiedades de un objeto de la BD
EXEC sp_help 'Clientes'

--Llaves primarias de una tabla
EXEC sp_helpindex 'Clientes'

--Información de los usuarios y procesos actualez 
EXEC sp_who

--Rendimiento del servidor
EXEC sp_monitor

--Espacio usado por la DB
EXEC sp_spaceused

--Puerto de escucha del SQL SERVER
EXEC sp_readerrorlog 0, 1

--NUESTROS PROCEDIMIENTOS


--Visualizar historial 
CREATE PROCEDURE sp_ObtenerHistorial
	@usuarioId INT
AS 
BEGIN

SELECT h.HistorialID, p.Titulo, h.FechaVisualizacion
FROM HistorialVisualizacion h
JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioId
ORDER BY h.FechaVisualizacion DESC
END

exec sp_ObtenerHistorial 5


--Insertar peliculas
CREATE PROCEDURE sp_InsertarTablas 
	@Titulo NVARCHAR,
	@Genero NVARCHAR,
	@Fecha_estreno DATE
AS
BEGIN
	INSERT INTO Peliculas(Titulo, Genero, FechaEstreno)
	VALUES(@Titulo, @Genero, @Fecha_estreno)

END

EXEC sp_InsertarTablas 'Intensamente 2', 'Infantil', '2023-06-13'