--Inner Join
--Pide especificamente los datos que queramos mostrar, en ese caso, id compra, nombre de cliente, fecha de comora y el total
SELECT c.id_compra AS 'Cliente ID', cl.nombre AS Cliente, c.fecha_compra AS 'Fecha de Compra' , c.total AS 'Total de compra'
FROM Compras c
JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

-- Left Join 
--Se muestra lo mismo ya que del lado izquierdo es donde se encuentran los clientes que si compraro algo
SELECT c.id_compra AS 'Cliente ID', cl.nombre AS Cliente, c.fecha_compra AS 'Fecha de Compra' , c.total AS 'Total de compra'
FROM Compras c
LEFT JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

--Right Join
--Se muestran hasta los clientes que no han comprado ya que del lado derecho estan todos los clientes, hayan comprado o no
SELECT c.id_compra AS 'Cliente ID', cl.nombre AS Cliente, c.fecha_compra AS 'Fecha de Compra' , c.total AS 'Total de compra'
FROM Compras c
RIGHT JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

--Full Join
--Se unen todos los datos de ambas tablas que estamos uniendo
SELECT * 
FROM Clientes cl
FULL JOIN Compras c
ON c.id_cliente = cl.id_cliente;

