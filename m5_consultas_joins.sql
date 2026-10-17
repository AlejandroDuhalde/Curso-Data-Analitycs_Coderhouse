--Consulta 1:Vista Base del Proyecto (INNER JOIN)
SELECT
v.fecha_venta AS Fecha,
c.id_cliente AS idCliente,
c.nombre AS Cliente,
c.ciudad AS Ciudad,
p.nombre_producto AS Producto,
cat.nombre_categoria AS Categoria,
cat.descripcion AS Descripcion,
v.cantidad AS Cantidad,
v.precio_unitario AS PrecioUnitario,
v.cantidad*v.precio_unitario AS MontoTotal

FROM dbo.ventas AS v
INNER JOIN dbo.productos p
	ON v.id_producto = p.id_producto 
INNER JOIN dbo.clientes c
	ON v.id_cliente = c.id_cliente
INNER JOIN dbo.categorias cat
	ON p.id_categoria = cat.id_categoria
ORDER BY MontoTotal desc;
--Hallazgo: El cliente que mas gastó en una compra fue María Lopez
--Consulta 2:Clientes sin Ventas(LEFT JOIN)
SELECT
	c.nombre AS Nombre,
	c.fecha_registro AS FechaRegistro,
	c.email AS Email,
	c.ciudad AS Ciudad
FROM dbo.clientes c
LEFT JOIN dbo.ventas v
	ON c.id_cliente = v.id_cliente
WHERE v.id_venta is NULL;
--Hallazgo: El unico cliente registrado que no realizo ninguna compra fue Carlos Ruiz

/*Nota al profesor: Para que me aparezca al menos un cliente en la tabla, 
modifique la base de datos, borrando las filas que contenian el id cliente=2*/

--Consulta 3: Productos sin Ventas (LEFT JOIN)
SELECT
	p.nombre_producto AS Producto,
	cat.nombre_categoria AS Categoria,
	cat.descripcion AS Descripcion,
	p.precio AS Precio,
	p.stock AS Stock

FROM dbo.productos p
LEFT JOIN dbo.ventas v
	ON p.id_producto = v.id_producto
INNER JOIN dbo.categorias cat
	ON p.id_categoria = cat.id_categoria
WHERE v.id_venta is NULL;
--Hallazgo: El único producto que no tuvo ventas fue el mouse inalambrico

/*Nota al profesor: Para que me aparezca al menos un producto en la tabla, 
modifique la base de datos, borrando las filas que contenian el id producto=2*/

--Consulta 4:Consolidado por canal (UNION ALL)
SELECT canal, SUM(Total) AS TotalCanal
FROM(
	SELECT fecha_venta,
	cantidad*precio_unitario AS Total,
	'Online' AS canal
	FROM dbo.ventas v
	INNER JOIN dbo.clientes c
		ON v.id_cliente = c.id_cliente
	WHERE c.ciudad IN( 'Córdoba','Rosario','Tucumán','Mendoza')
	UNION ALL

	SELECT fecha_venta,
	cantidad*precio_unitario AS Total,
	'Presencial' AS canal
	FROM dbo.ventas v
	INNER JOIN dbo.clientes c
		ON v.id_cliente = c.id_cliente
	WHERE c.ciudad ='Buenos Aires'
	
) AS Consolidado
GROUP BY canal;
--Hallazgo: El canal de venta que genera un mayor ingreso es el online