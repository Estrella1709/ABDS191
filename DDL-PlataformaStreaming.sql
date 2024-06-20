CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Pass NVARCHAR(100) NOT NULL,
    FechaRegistro DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Peliculas (
    PeliculaID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(100) NOT NULL,
    Genero NVARCHAR(50),
    FechaEstreno DATE
);

CREATE TABLE Suscripciones (
    SuscripcionID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    Tipo NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE HistorialVisualizacion (
    HistorialID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NOT NULL,
    PeliculaID INT NOT NULL,
    FechaVisualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID)
);

INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES
('Estrella Aguillon', 'estrella.aguillon17@example.com', 'password123', GETDATE()),
('Gonzalo Uribe', 'gonzalouribe49@example.com', 'password456', GETDATE()),
('Katherine Villanueva', 'kat.villanueva16@example.com', 'password789', GETDATE()),
('Ana Martinez', 'ana.martinez@example.com', 'password101', GETDATE()),
('Luis Fernandez', 'luis.fernandez@example.com', 'password102', GETDATE()),
('Laura Diaz', 'laura.diaz@example.com', 'password103', GETDATE()),
('Miguel Torres', 'miguel.torres@example.com', 'password104', GETDATE()),
('Elena Ramirez', 'elena.ramirez@example.com', 'password105', GETDATE()),
('Jorge Lopez', 'jorge.lopez@example.com', 'password106', GETDATE()),
('Sofia Herrera', 'sofia.herrera@example.com', 'password107', GETDATE());

INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) VALUES
('The Shawshank Redemption', 'Drama', '1994-09-22'),
('The Godfather', 'Crimen', '1972-03-24'),
('The Dark Knight', 'Acción', '2008-07-18'),
('Pulp Fiction', 'Crimen', '1994-10-14'),
('Forrest Gump', 'Drama', '1994-07-06'),
('Inception', 'Ciencia Ficción', '2010-07-16'),
('Fight Club', 'Drama', '1999-10-15'),
('The Matrix', 'Ciencia Ficción', '1999-03-31'),
('The Lord of the Rings: The Fellowship of the Ring', 'Fantasía', '2001-12-19'),
('Star Wars: Episode IV - A New Hope', 'Ciencia Ficción', '1977-05-25'),
('The Lion King', 'Animación', '1994-06-15');

INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
(1, '2023-01-01', '2023-06-30', 'Mensual'),
(2, '2023-02-01', '2023-07-31', 'Anual'),
(3, '2023-03-01', NULL, NULL),
(4, '2023-04-01', '2023-09-30', 'Mensual'),
(5, '2023-05-01', '2023-10-31', 'Anual'),
(6, '2023-06-01', NULL, NULL),
(7, '2023-07-01', '2023-12-31', 'Mensual');

INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion) VALUES
(1, 1, GETDATE()),
(1, 2, GETDATE()),
(2, 3, GETDATE()),
(2, 4, GETDATE()),
(3, 5, GETDATE()),
(3, 6, GETDATE()),
(4, 7, GETDATE()),
(4, 8, GETDATE()),
(5, 9, GETDATE()),
(5, 10, GETDATE()),
(6, 11, GETDATE()),
(6, 1, GETDATE()),
(7, 2, GETDATE()),
(7, 3, GETDATE()),
(8, 4, GETDATE()),
(8, 5, GETDATE()),
(9, 6, GETDATE()),
(9, 7, GETDATE()),
(10, 8, GETDATE()),
(10, 9, GETDATE());

SELECT * FROM VistaGlobal;