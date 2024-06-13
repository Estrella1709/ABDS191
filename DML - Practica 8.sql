
CREATE VIEW Vista_ComprasComic AS
SELECT cc.id_CC, cc.cantidad, c.titulo AS 'Nombre Comic', cm.id_compra, cm.total
FROM Comic_Compras cc
JOIN Comics c ON cc.id_comic = c.id_comic
JOIN Compras cm ON cc.id_compra = cm.id_compra;

