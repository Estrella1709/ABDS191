CREATE VIEW Vista_ComiscComprados AS
SELECT c.id_cliente, c.nombre AS 'Nombre cliente', cc.cantidad AS 'Cantidad de comics comprados'
FROM Clientes c
JOIN Comic_Compras cc
ON c.id_cliente = cc.cantidad;