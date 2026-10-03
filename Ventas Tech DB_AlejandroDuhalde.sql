
--Creación de la base de datos
CREATE DATABASE VentasTechDB;
USE VentasTechDB;

--Eliminación de tablas
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

--Creacion de tablas

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY,
	NombreCategoria NVARCHAR(50) NOT NULL,
	Descripcion NVARCHAR(200)
	);

CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY,
	Nombre NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE,
	Ciudad NVARCHAR(50),
	FechaRegistro DATE NOT NULL);

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY,
	NombreProducto NVARCHAR(50) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	CategoriaID INT FOREIGN KEY REFERENCES Categorias(CategoriaID),
	Stock INT,
	Activo BIT);

CREATE TABLE Ventas(
	VentaID INT PRIMARY KEY,
	ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
	ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
	Cantidad INT NOT NULL,
	PrecioUnitario DECIMAL(10,2) NOT NULL,
	FechaVenta DATE NOT NULL);

--Insersion de datos
INSERT INTO Categorias (CategoriaID,NombreCategoria,Descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');
INSERT INTO Productos (ProductoID, NombreProducto, CategoriaID, Precio, Stock, Activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);
INSERT INTO Clientes (ClienteID, Nombre, Email, Ciudad, FechaRegistro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');


INSERT INTO ventas (VentaID, ClienteID, ProductoID, Cantidad, PrecioUnitario, FechaVenta) VALUES
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

  --Validacion
  SELECT * FROM Categorias;
  SELECT * FROM Clientes;
  SELECT * FROM Productos;
  SELECT * FROM Ventas;



  

	
