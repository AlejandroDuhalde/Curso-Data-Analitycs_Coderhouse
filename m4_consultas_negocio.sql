--Consulta 1-Resumen ejecutivo mensual
	--Total Facturado
USE VentasTechDB
SELECT MONTH(fecha_venta) AS mes,
--Total facturado
SUM (cantidad*precio_unitario) AS total_facturado,
--Cantidad de pedidos
COUNT(id_venta) AS cantidad_pedidos,
--Ticket promedio
AVG(cantidad*precio_unitario) AS ticket_promedio
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes
--Consulta 2-Ranking de productos
SELECT 
TOP 5 id_producto ,
SUM(cantidad*precio_unitario) AS total_facturado,
SUM (cantidad) AS unidades_vendidas
FROM Ventas
GROUP BY id_producto
ORDER BY total_facturado DESC

--Consulta 3-Clientes recurrentes
SELECT
id_cliente ,
COUNT (id_cliente) AS cantidad_compras,
SUM(cantidad*precio_unitario) AS total_gastado
FROM Ventas
GROUP BY id_cliente 
HAVING COUNT(*)>1
ORDER BY total_gastado DESC

--Consulta 4-Meses por encima/debajo del promedio

;WITH totales AS	(
	SELECT 
	SUM(cantidad*precio_unitario) AS total,
	MONTH(fecha_venta) AS mes
	FROM Ventas
	GROUP BY MONTH(fecha_venta)  
	)
SELECT mes,
       total AS total_facturado,
		CASE
			WHEN total>(SELECT AVG (total) FROM totales) THEN 'Por encima del promedio'
			ELSE 'Por debajo del promedio'
	END AS Calificacion
	
FROM totales
ORDER BY mes
--El mes 4 es el unico cuyo total facturado es superior al promedio
--El cliente con mayor total gastado es el 1
--La mayor cantidad de pedidos se realizo en el mes de marzo
/*Nota al profesor: dos de los meses que aparecen en las tablas,
fueron obtenidos modificando la base de datos creada en el modulo 3, para que tenga sentido el analisis, 
debido a que todos los datos correspondian al mismo mes originalmente*/
