--Procedimiento que inserta una nueva suscripción y al momento de hacerla actualice
--la fecha de registro del usuario que ha hecho la nueva suscripción
CREATE PROCEDURE sp_InsertarSuscripciones
--Declaración de las variables para insertar
--Se ocupan todos los atributos que tiene "Suscripciones" ya que estamos creando
--una nueva suscripción
	@UsuarioID INT,
	@FechaInicio DATE,
	@FechaFin DATE,
	@Tipo NVARCHAR(50)
AS
BEGIN

--Creamos dentro del procedimiento la transaccion
BEGIN TRANSACTION
--Agregamos el try de la transaccion
BEGIN TRY

--Agregamos el insert para crear la nueva suscripción
	INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo)
	VALUES(@UsuarioID, @FechaInicio, @FechaFin, @Tipo)

--Se actualiza la tabla "Usuarios" ya que se tiene que modificar la fecha de registro
--Igualamos "FechaRegistro" con la variable "@FechaInicio" ya que eso es lo que se va a actualizar
--Este dato se va a actualizar por medio del "UsuarioID" que igualamos con la variable "@UsuarioID" para
--que sepa de que usuario estamos hablando.
	UPDATE Usuarios SET FechaRegistro = @FechaInicio WHERE UsuarioID=@UsuarioID

--Si se cumple que el usuarioID existe, se hace el commit
	COMMIT;
END TRY

--Creamos un catch para cuando no se cumpla el try
BEGIN CATCH
--Se hace un rollback para echar para atras todos los posibles cambios
	ROLLBACK;
	DECLARE @ErrorMessage NVARCHAR(4000)
	SET @ErrorMessage = ERROR_MESSAGE ();
	PRINT @ErrorMessage
END CATCH

END


SELECT * FROM Usuarios
SELECT * FROM Suscripciones

EXEC sp_InsertarSuscripciones 5, '2024-07-01', '2024-08-01', 'Mensual'
EXEC sp_InsertarSuscripciones 15, '2024-07-01', '2024-08-01', 'Mensual'

