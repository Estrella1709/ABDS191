INSERT INTO Clientes (nombre, correo_electronico, contraseña) VALUES
('Estrella', 'estrellatorrijos17@gmail.com', 'estrella17'),
('Gonzalo', 'gonzalouribe30@gmail.com', 'gonza3017'),
('Katherine', 'katvillanueva13@gmail.com', 'kat29082003'),
('Sebastian', 'sebasacosta22@gmail.com', 'cebollas22'),
('Bruno', 'brunini92pio@gmail.com', 'puropioss19'),
('Diego', 'diegomapro11@gmail.com', 'diegoespro123'),
('DiegoChif', 'mastirchifdiego14@gmail.com', 'oalpnmt66'),
('Santiago', 'santiagorizo69@gmail.com', 'tmpdjjj12'),
('Omar', 'omarmomiscrozzy66@gmail.com', 'xcrozzy20'),
('Lucía', 'luciahernandez88@gmail.com', 'lucia8888'),
('Marcos', 'marcosperez74@gmail.com', 'marcos7474'),
('Valentina', 'valentinagonzalez21@gmail.com', 'valen2121');

INSERT INTO Comics (titulo, anio, precio) VALUES
('Astro City', 96, 11.99),
('Invincible', 03, 13.49),
('100 Bullets', 99, 14.99),
('Preacher', 95, 17.99),
('Black Hole', 95, 19.99),
('Sin City', 91, 12.99),
('Kingdom Come', 96, 16.99),
('The Umbrella Academy', 07, 11.49),
('Hawkeye: My Life as a Weapon', 12, 10.99),
('Saga of the Swamp Thing', 84, 9.99),
('Ms. Marvel', 14, 12.99),
('Planetary', 99, 13.99),
('Transmetropolitan', 97, 15.99),
('The League of Extraordinary Gentlemen', 99, 16.49),
('Fell', 05, 9.49);

INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(12, 10, 1),
(14, 0, 0),
(16, 5, 1),
(18, 8, 1),
(20, 3, 1),
(22, 12, 1),
(24, 7, 1),
(26, 0, 0),
(28, 15, 1),
(30, 6, 1),
(32, 9, 1),
(34, 4, 1),
(36, 11, 1),
(38, 13, 1),
(40, 2, 1);


INSERT INTO Compras(id_cliente, fecha_compra, total) VALUES
(1, '2024-05-20', 59.95),
(2, '2024-05-21', 23.49),
(3, '2024-05-22', 34.97),
(4, '2024-05-23', 17.99),
(5, '2024-05-24', 89.94),
(6, '2024-05-25', 45.97),
(7, '2024-05-26', 51.96),
(1, '2024-05-27', 29.97),  -- Estrella
(3, '2024-05-27', 19.99),  -- Katherine
(5, '2024-05-27', 39.98);  -- Bruno