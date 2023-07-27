-- select * from fabricantes
-- EJERCICIO 1
SELECT * FROM articulos;
SELECT * FROM fabricantes;

-- 1.1. Obtener los nombres de los productos de la tienda
SELECT nombre FROM articulos;

-- 1.2. Obtener los nombres y los precios de los productos de la tienda
SELECT nombre, precio FROM articulos;

-- 1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200€
SELECT nombre FROM articulos WHERE precio <= 200;

-- 1.4. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y 120€ (ambas cantidades incluidas)
SELECT * FROM articulos WHERE precio BETWEEN 60 and 120;

-- 1.5. Obtener el nombre y el precio en pesetas (es decir el precio en euros multiplicado por 166'386)
SELECT nombre, precio*(166.386) FROM articulos;

-- 1.6. Seleccionar el precio medio de todos los productos
SELECT AVG(precio) FROM articulos;

-- 1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2
SELECT AVG(precio) FROM articulos WHERE fabricante=2;

-- 1.8. Obtener el número de artículos cuyo precio sea mayor o igual a 180€
SELECT COUNT(codigo) FROM articulos WHERE precio >= 180;

-- 1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180€
		-- y ordenarlos descendentemente por precio, y luego ascendentemente por nombre
SELECT nombre,precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC, nombre;

-- 1.10. Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y su fabricante
SELECT * FROM articulos INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;

-- 1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante
-SELECT * FROM articulos;

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante

-- 1.13.
-- 1.14.
-- 1.15.
-- 1.16.
-- 1.17.
-- 1.18.
-- 1.19.
-- 1.20.
