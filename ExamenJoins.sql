CREATE TABLE Autores (
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);

ALTER TABLE Comics
ADD id_autor bigint,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);

INSERT INTO Autores (nombre, pais_origen)VALUES
('Sarah JH.', 'México'),
('Xavier Velasco', 'México'),
('Adam SH.', 'Colombia'),
('Katherine VG', 'Rumania;')


UPDATE Comics SET id_autor = 300 WHERE id_comic = 12
UPDATE Comics SET id_autor = 301 WHERE id_comic = 14
UPDATE Comics SET id_autor = 302 WHERE id_comic = 16
UPDATE Comics SET id_autor = 303 WHERE id_comic = 18
UPDATE Comics SET id_autor = 301 WHERE id_comic = 20
UPDATE Comics SET id_autor = 302 WHERE id_comic = 22
UPDATE Comics SET id_autor = 303 WHERE id_comic = 24
UPDATE Comics SET id_autor = 300 WHERE id_comic = 26
UPDATE Comics SET id_autor = 301 WHERE id_comic = 28
UPDATE Comics SET id_autor = 302 WHERE id_comic = 30
UPDATE Comics SET id_autor = 303 WHERE id_comic = 32


SELECT * FROM Comics


SELECT a.nombre AS 'Nombre Autor', c.titulo AS 'Titulo Comic', i.cantidad_disponible AS 'Cantidad'
FROM Autores a
RIGHT JOIN Comics c ON  a.id_autor = c.id_autor
JOIN Inventario i ON c.id_comic = i.id_comic


SELECT a.pais_origen AS 'Pais de Origen', a.nombre AS 'Nombre Autor' , c.titulo AS 'Titulo Comic'
FROM Comics c
JOIN Autores a ON c.id_autor = a.id_autor

