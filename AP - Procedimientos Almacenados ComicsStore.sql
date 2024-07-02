--Insertar autores
CREATE PROCEDURE sp_InsertarAutor
    @nombre VARCHAR(100),
    @pais_origen VARCHAR(100)
AS
BEGIN
    INSERT INTO Autores (nombre, pais_origen)
    VALUES (@nombre, @pais_origen);
END;

--Prubea
EXEC sp_InsertarAutor 'John Doe', 'USA';
EXEC sp_InsertarAutor 'Jane Smith', 'UK';
EXEC sp_InsertarAutor 'Carlos Ruiz', 'Mexico';

--Insertar clientes
CREATE PROCEDURE sp_InsertarCliente
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(100),
    @contrasena VARCHAR(255)
AS
BEGIN
    INSERT INTO Clientes (nombre, correo_electronico, contraseña)
    VALUES (@nombre, @correo_electronico, @contrasena);
END;

--Prueba
EXEC sp_InsertarCliente 'Alis Ramirez', 'alis@example.com', 'password123';
EXEC sp_InsertarCliente 'Juan Gomez', 'juan@example.com', 'securepass344';
EXEC sp_InsertarCliente 'Sofia Hernandez', 'sofia@example.com', 'mypassword';

--Objetivo: Editar información de autores
CREATE PROCEDURE sp_EditarAutor
    @id_autor BIGINT,
    @nombre VARCHAR(100),
    @pais_origen VARCHAR(100)
AS
BEGIN
    UPDATE Autores
    SET nombre = @nombre, pais_origen = @pais_origen
    WHERE id_autor = @id_autor;
END;

--Prueba
EXEC sp_EditarAutor 1, 'Johnathan Doe', 'USA';
EXEC sp_EditarAutor 2, 'Janet Smith', 'UK';
EXEC sp_EditarAutor 3, 'Carlos Ruiz Jr.', 'Mexico';

--Objetivo: Editar la información de un cliente en la tabla Clientes
CREATE PROCEDURE sp_EditarCliente
    @id_cliente BIGINT,
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(100),
    @contraseña VARCHAR(255)
AS
BEGIN
    UPDATE Clientes
    SET nombre = @nombre, correo_electronico = @correo_electronico, contraseña = @contraseña
    WHERE id_cliente = @id_cliente;
END;

--Prueba
EXEC sp_EditarCliente 13, 'Alison Ramirez', 'alis.new@example.com', 'newpassword123';
EXEC sp_EditarCliente 14, 'Juan Luis Gomez', 'juan.new@example.com', 'newsecurepass';
EXEC sp_EditarCliente 15, 'Sofia Elena Hernandez', 'sofia.new@example.com', 'newmypassword';

SELECT * FROM Clientes


--Objetivo del procedimiento: Eliminar un autor de la tabla Autores
CREATE PROCEDURE sp_EliminarAutor
    @id_autor BIGINT
AS
BEGIN
    DELETE FROM Autores WHERE id_autor = @id_autor;
END;

--Prueba
EXEC sp_EliminarAutor 304;
EXEC sp_EliminarAutor 305;
EXEC sp_EliminarAutor 306;

SELECT * FROM Autores

--Objetivo del procedimiento: Eliminar un cliente de la tabla Clientes
CREATE PROCEDURE sp_EliminarCliente
    @id_cliente BIGINT
AS
BEGIN
    DELETE FROM Clientes WHERE id_cliente = @id_cliente;
END;

--Prueba
EXEC sp_EliminarCliente 13;
EXEC sp_EliminarCliente 14;
EXEC sp_EliminarCliente 15;

--Objetivo del procedimiento: Consultar todas las compras realizadas por un cliente específico
CREATE PROCEDURE sp_ConsultarComprasPorCliente
    @id_cliente BIGINT
AS
BEGIN
    SELECT c.id_compra, c.fecha_compra, c.total
    FROM Compras c
    JOIN Clientes cl ON c.id_cliente = cl.id_cliente
    WHERE c.id_cliente = @id_cliente;
END;


--Prueba
EXEC sp_ConsultarComprasPorCliente 1;
EXEC sp_ConsultarComprasPorCliente 2;
EXEC sp_ConsultarComprasPorCliente 3;

--Objetivo del procedimiento: Consultar todos los cómics junto con la información de sus autores
CREATE PROCEDURE sp_ConsultarComicsYAutores
    @id_comic BIGINT
AS
BEGIN
    SELECT co.id_comic, co.titulo, co.anio, co.precio, a.nombre AS autor, a.pais_origen
    FROM Comics co
    JOIN Autores a ON co.id_autor = a.id_autor
    WHERE co.id_comic = @id_comic;
END;

--Prueba
EXEC sp_ConsultarComicsYAutores 12;
EXEC sp_ConsultarComicsYAutores 14;
EXEC sp_ConsultarComicsYAutores 16;

SELECT * FROM Comics
--Objetivo del procedimiento: Consultar el inventario de un cómic específico.
CREATE PROCEDURE sp_ConsultarInventarioDeComic
    @id_comic BIGINT
AS
BEGIN
    SELECT i.id_inventario, i.cantidad_disponible, i.disponibilidad
    FROM Inventario i
    JOIN Comics co ON i.id_comic = co.id_comic
    WHERE i.id_comic = @id_comic;
END;


--Prueba
EXEC sp_ConsultarInventarioDeComic 12;
EXEC sp_ConsultarInventarioDeComic 16;
EXEC sp_ConsultarInventarioDeComic 14;

SELECT * FROM Inventario