
--Agregar nuevo comic y asignar autor
CREATE PROCEDURE sp_nuevoComicAsignaAutor
    @titulo VARCHAR(100),
    @anio TINYINT,
    @precio DECIMAL(10, 2),
    @id_autor BIGINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar el nuevo cómic
        INSERT INTO Comics (titulo, anio, precio, id_autor)
        VALUES (@titulo, @anio, @precio, @id_autor);

        -- Obtener el id del nuevo cómic
        DECLARE @nuevo_comic BIGINT;
        SELECT @nuevo_comic = SCOPE_IDENTITY();

        -- Agregar el nuevo cómic al inventario
        INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad)
        VALUES (@nuevo_comic, 0, 0); -- Inicialmente sin stock y no disponible

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


--Eliminar cliente y registro de compras

CREATE PROCEDURE sp_EliminarClienteYRegistroCompras
    @id_cliente BIGINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar registros de Comic_Compras asociados a las compras del cliente
        DELETE FROM Comic_Compras
        WHERE id_compra IN (SELECT id_compra FROM dbo.Compras WHERE id_cliente = @id_cliente);

        -- Eliminar registros de Compras asociados al cliente
        DELETE FROM Compras
        WHERE id_cliente = @id_cliente;

        -- Eliminar el cliente
        DELETE FROM Clientes
        WHERE id_cliente = @id_cliente;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


--Eliminar autor y comics del autor eliminado
CREATE PROCEDURE sp_eliminarAutorComics
    @id_autor BIGINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar registros de Comic_Compras asociados a los cómics del autor
        DELETE FROM Comic_Compras
        WHERE id_comic IN (SELECT id_comic FROM dbo.Comics WHERE id_autor = @id_autor);

        -- Eliminar registros de Inventario asociados a los cómics del autor
        DELETE FROM Inventario
        WHERE id_comic IN (SELECT id_comic FROM dbo.Comics WHERE id_autor = @id_autor);

        -- Eliminar registros de Comics asociados al autor
        DELETE FROM Comics
        WHERE id_autor = @id_autor;

        -- Eliminar el autor
        DELETE FROM Autores
        WHERE id_autor = @id_autor;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

--Eliminar comic y comic del inventario
CREATE PROCEDURE sp_EliminarComicInventario
    @id_comic BIGINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar registros de Comic_Compras asociados al cómic
        DELETE FROM Comic_Compras
        WHERE id_comic = @id_comic;

        -- Eliminar el registro del cómic en el inventario
        DELETE FROM dbo.Inventario
        WHERE id_comic = @id_comic;

        -- Eliminar el cómic
        DELETE FROM Comics
        WHERE id_comic = @id_comic;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


--Comprar comic actualiza el inventario y resta 1 de la cadidad de comics
CREATE PROCEDURE sp_CompararComicRestarDelInventario
    @id_cliente BIGINT,
    @id_comic BIGINT,
    @cantidad TINYINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @nueva_compra BIGINT;
        
        -- Insertar la nueva compra
        INSERT INTO Compras (id_cliente, fecha_compra, total)
        VALUES (@id_cliente, GETDATE(), 0);

        -- Obtener el id de la nueva compra
        SELECT @nueva_compra = SCOPE_IDENTITY();

        -- Insertar el detalle de la compra
        INSERT INTO Comic_Compras (id_comic, id_compra, cantidad)
        VALUES (@id_comic, @nueva_compra, @cantidad);

        -- Actualizar el inventario
        UPDATE Inventario
        SET cantidad_disponible = cantidad_disponible - @cantidad,
            disponibilidad = CASE WHEN cantidad_disponible - @cantidad > 0 THEN 1 ELSE 0 END
        WHERE id_comic = @id_comic;

        -- Calcular el total de la compra
        UPDATE Compras
        SET total = (SELECT SUM(cc.cantidad * c.precio)
                     FROM Comic_Compras cc
                     JOIN Comics c ON cc.id_comic = c.id_comic
                     WHERE id_compra = @nueva_compra)
        WHERE id_compra = @nueva_compra;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

EXEC sp_CompararComicRestarDelInventario 5,  22, 2;
EXEC sp_CompararComicRestarDelInventario 1,  12, 2;

SELECT * FROM Clientes
SELECT * FROM Inventario
SELECT * FROM Comics