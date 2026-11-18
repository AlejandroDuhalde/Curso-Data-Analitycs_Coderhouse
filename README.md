# RetailPro – Análisis de ventas con SQL Server

Proyecto del curso de Data Analytics (Coderhouse). Analiza las ventas de **RetailPro**, una empresa de tecnología, a partir de la base `VentasTechDB`. Las consultas responden preguntas de negocio sobre facturación mensual, productos, clientes y canales de venta.

> **Nota sobre los datos:** la base tiene datos de práctica, no datos reales. Para que el análisis mensual tuviera sentido, se modificaron fechas y aparecieron los meses 3, 4 y 5. Para las consultas de "sin ventas" del Módulo 5 se borraron ventas puntuales. Esto se detalla abajo.

## Herramientas
- **SQL Server 2022** (motor de base de datos)
- **SQL Server Management Studio 22** (ejecución de scripts)
- **Git / GitHub** (versionado y entrega)
- **Claude.ai** (revisión de código y documentación asistida con IA)

## Modelo de datos

| Tabla | Contenido | Clave |
|---|---|---|
| `Categorias` | Categorías de producto y su descripción | `id_categoria` |
| `Productos` | Nombre, categoría, precio y stock | `id_producto` → `id_categoria` |
| `Clientes` | Nombre, email, ciudad y fecha de registro | `id_cliente` |
| `Ventas` | Fecha, cliente, producto, cantidad y precio unitario | `id_venta` → `id_cliente`, `id_producto` |

## Archivos del repositorio

| Archivo | Módulo | Qué hace |
|---|---|---|
| `m3_creacion_base.sql` | Módulo 3 | Crea `VentasTechDB`, sus 4 tablas y los datos de ejemplo. Es re-ejecutable porque hace DROP + CREATE. |
| `m4_consultas_negocio.sql` | Módulo 4 | Resumen mensual, top 5 de productos, clientes recurrentes y meses por encima o por debajo del promedio. |
| `m5_consultas_joins.sql` | Módulo 5 | Vista base (INNER JOIN), clientes y productos sin ventas (LEFT JOIN) y consolidado por canal (UNION ALL). |

## Cómo ejecutar los scripts
1. Clonar o descargar el repositorio.
2. Abrir **SSMS** y conectarse a la instancia local de SQL Server (autenticación de Windows).
3. Abrir y ejecutar **primero** `m3_creacion_base.sql` (F5). Crea la base y la carga con datos. Sin este paso los otros scripts fallan.
4. Verificar que arriba esté seleccionada la base `VentasTechDB`, o ejecutar `USE VentasTechDB;`.
5. Abrir `m4_consultas_negocio.sql`, seleccionar **una consulta por vez** y ejecutarla con F5. Cada consulta está separada por un comentario `--Consulta N`.
6. Repetir con `m5_consultas_joins.sql`.
7. **Para reproducir las consultas 2 y 3 del Módulo 5**, antes hay que borrar las ventas con `id_cliente = 2` y con `id_producto = 2`, como explican las notas del script. Ese borrado cambia los totales del Módulo 4: conviene correr el Módulo 4 antes del borrado o volver a ejecutar el script del Módulo 3 después.

## Principales hallazgos
- **Concentración en un producto:** la Laptop Pro 15 genera el 56 % de la facturación ($3.600 de $6.444). Junto con el Monitor 4K, la categoría Computación suma el 77 %.
- **Volumen vs. valor:** el Mouse Inalámbrico es el producto con más unidades vendidas (13), pero el que menos factura dentro del top 5 ($364). Es un buen candidato para venta cruzada con laptops y monitores.
- **Meses:** abril fue el único mes por encima del promedio ($2.850 con solo 2 pedidos). Marzo tuvo más pedidos (6), pero el ticket promedio más bajo ($334).
- **Canal:** el canal online (clientes del interior) factura más que el presencial (Buenos Aires).

> Con 10 ventas en total, estos hallazgos sirven para practicar el método de análisis, no para sacar conclusiones estadísticas.

## Autor
Alejandro Duhalde – Curso de Data Analytics, Coderhouse (2026)
