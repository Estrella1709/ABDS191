
--TSQL
/*
--Declarar variables (declare + @nombrevariable + tipo de dato)
declare @idCliente int

--Inicializar o asignar valor (set + @variable + valor)
set @idCliente = 8

--if
--IF @idCliente = 8
	--select * from Clientes where id_cliente = @idCliente
*/


--IF @idCliente = 9
	--set @edad = 25
	--select * from Clientes where id_cliente = @idCliente
	--print @edad
/*
declare @edad int
set @idCliente = 9
--Delimitar el if (BEGIN, END)
IF @idCliente = 9
	BEGIN
		set @edad = 25
		select * from Clientes where id_cliente = @idCliente
		print @edad
	END
*/

/*
declare @edad int
set @idCliente = 8
--IF-ELSE 
IF @idCliente = 9
	BEGIN
		set @edad = 25
		select * from Clientes where id_cliente = @idCliente
		print @edad
	END
ELSE
	BEGIN
		print'Error:'
		print 'id no autorizado para la consulta'
	END
*/

/*
declare @edad int
set @idCliente = 9
-- IF-ELSE ANIDADO
IF @idCliente = 9
	BEGIN
		set @edad = 25
		select * from Clientes where id_cliente = @idCliente
		print @edad

		IF EXISTS (select * from Clientes where id_cliente = 10)
		print 'Si existe'
	END
ELSE
	BEGIN
		print'Error:'
		print 'id no autorizado para la consulta'
	END
*/

--WHILE

/*
declare @contador int = 0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador + 1
END
*/

--Return
/*
declare @contador int = 0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		RETURN
	print ('Hola')
END
print ('Aqui continua el flujo')
*/
--BREAK

/*
declare @contador int = 0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		BREAK
	print ('Hola')
END
print ('Aqui continua el flujo')
*/

/*
declare @contador int = 0

WHILE @contador <= 10
BEGIN
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		BREAK
	print ('Hola')
END
print ('Aqui continua el flujo')

BEGIN TRY
	set @contador = 'Estrella Aguillon'
END TRY
BEGIN CATCH
	print ('La variable contador solo acepta enteros')
END CATCH

print ('soy otra consulta')
print ('yo tambien')
*/

--CASE

declare @valor int
declare @resultado char(10) = ''
set @valor = 30

set @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
					   WHEN @valor = 20 THEN 'MORADO'
					   WHEN @valor = 30 THEN 'AZUL'
					   ELSE 'GRIS'
					   END)
print @resultado

select * , (CASE WHEN disponibilidad=1 THEN 'VERDE'
			     WHEN disponibilidad=0 THEN 'ROJO'
				 ELSE'NEGRO'
				 END) AS INDICADOR
				 FROM Inventario
