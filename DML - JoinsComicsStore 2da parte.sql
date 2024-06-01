SELECT c.nombre AS Comics, i.cantidad_disponible AS Cantidad
FROM Comics c
JOIN Inventarios i ON c.id_comic = i.id_comic
where i.cantidad_disponible >= 0;



SELECT 
    cl.nombre AS Clientes,
    co.id_compra,
    c.nombre AS Comics,
    cc.cantidad
FROM Clientes cl
JOIN compras co ON cl.id_clientes = co.id_cliente
JOIN Comic_Compras cc ON co.id_compra = cc.id_compra
JOIN Comics c ON cc.id_comic = c.id_comic
ORDER BY cl.nombre;


SELECT 
    co.id_compra,
    c.nombre AS nombre_comic,
    i.cantidad_disponible AS cantidad_disponible
FROM Comics c
LEFT JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
LEFT JOIN Compras co ON cc.id_compra = co.id_compra
LEFT JOIN Clientes cl ON co.id_cliente = cl.id_clientes
LEFT JOIN Inventarios i ON c.id_comic = i.id_comic
ORDER BY c.nombre;


SELECT 
    c.nombre AS nombre_comic,
    i.cantidad_disponible AS cantidad_disponible
FROM Comics c
LEFT JOIN Inventarios i ON c.id_comic = i.id_comic
ORDER BY c.nombre;

SELECT 
    c.id_comic,
    c.nombre,
    c.anio,
    c.precio,
	i.id_inventario,
	c.id_comic
	i.cantidad_disponible,
    i.disponibilidad,
	cc.id__CC,
    i.cantidad_disponible AS cantidad
	c. id_compras
FROM 
    Comics c
LEFT JOIN 
    Comic_Compras cc ON c.id_comic = cc.id_comic
LEFT JOIN 
    Inventarios i ON c.id_comic = i.id_comic
ORDER BY 
    c.nombre;


select cl.nombre as 'Cliente', c.id_compra as 'Compra', cs.nombre as 'Comic', 
cc.cantidad as 'Cantidad', i.cantidad_disponible as 'En Inventario'
from Inventario i
join Comics cs on i.id_comic = cs.id_comic
left join Comic_Compras cc on cc.id_comic = cs.id_comic
left join Compras c on c.id_compra = cc.id_compra
join Clientes cl on cl.id_cliente = c.id_cliente