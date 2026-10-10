
--Creación de la base de datos
IF DB_ID (N'VentasTechDB' ) IS NULL
	BEGIN
		CREATE DATABASE VentasTechDB;
	END
	GO
USE VentasTechDB;

--DROP
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

--CREATE

CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY,
	nombre_categoria NVARCHAR(50) NOT NULL,
	descripcion NVARCHAR(200)
	);

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY,
	nombre NVARCHAR(50) NOT NULL,
	email NVARCHAR(50) UNIQUE,
	ciudad NVARCHAR(50),
	fecha_registro DATE NOT NULL);

CREATE TABLE productos(
	id_producto INT PRIMARY KEY,
	nombre_producto NVARCHAR(50) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	id_categoria INT FOREIGN KEY REFERENCES Categorias(id_categoria),
	stock INT DEFAULT 0,
	activo BIT DEFAULT 1);

CREATE TABLE ventas(
	id_venta INT PRIMARY KEY,
	id_cliente INT FOREIGN KEY REFERENCES clientes(id_cliente),
	id_producto INT FOREIGN KEY REFERENCES productos(id_producto),
	cantidad INT NOT NULL,
	precio_unitario DECIMAL(10,2) NOT NULL,
	fecha_venta DATE NOT NULL);

--INSERT
INSERT INTO categorias (id_categoria,nombre_categoria,descripcion) VALUES
  (1, N'Computación',    N'Laptops, PCs y monitores'),
  (2, N'Accesorios',     N'Periféricos y complementos'),
  (3, N'Audio',          N'Auriculares y parlantes'),
  (4, N'Almacenamiento', N'Discos y memorias');
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, N'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, N'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, N'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, N'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, N'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, N'Teclado Mecánico',   2,   95.00, 40, 1);
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, N'María López',  'maria@mail.com',  N'Buenos Aires', '2024-01-05'),
  (2, N'Carlos Ruiz',  'carlos@mail.com', N'Córdoba',      '2024-01-10'),
  (3, N'Ana Gómez',    'ana@mail.com',    N'Rosario',      '2024-02-01'),
  (4, N'Pedro Sanz',   'pedro@mail.com',  N'Mendoza',      '2024-02-15'),
  (5, N'Laura Torres', 'laura@mail.com',  N'Tucumán',      '2024-03-01');


INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

  --VALIDACION
  SELECT * FROM categorias;
  SELECT * FROM clientes;
  SELECT * FROM productos;
  SELECT * FROM ventas;



  

	
