-- select * from fabricantes
USE actividades;

-- EJERCICIO 1
SELECT * FROM articulos;
SELECT * FROM fabricantes;

-- 1.1. Obtener los nombres de los productos de la tienda
SELECT nombre FROM articulos;

-- 1.2. Obtener los nombres y los precios de los productos de la tienda
SELECT nombre, precio FROM articulos;

-- 1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200€
SELECT nombre FROM articulos
	WHERE precio <= 200;

-- 1.4. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y 120€ (ambas cantidades incluidas)
SELECT * FROM articulos
	WHERE precio BETWEEN 60 and 120;

-- 1.5. Obtener el nombre y el precio en pesetas (es decir el precio en euros multiplicado por 166'386)
SELECT nombre, precio*(166.386) FROM articulos;

-- 1.6. Seleccionar el precio medio de todos los productos
SELECT AVG(precio) FROM articulos;

-- 1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2
SELECT AVG(precio) FROM articulos
	WHERE fabricante=2;

-- 1.8. Obtener el número de artículos cuyo precio sea mayor o igual a 180€
SELECT COUNT(codigo) FROM articulos
	WHERE precio >= 180;

-- 1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180€
	-- y ordenarlos descendentemente por precio, y luego ascendentemente por nombre
SELECT nombre,precio FROM articulos
	WHERE precio >= 180
	ORDER BY precio DESC, nombre;

-- 1.10. Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y su fabricante
SELECT * FROM articulos
	INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;

-- 1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante
SELECT a.nombre, a.precio, f.nombre FROM articulos a
	INNER JOIN fabricantes f on a.fabricante=f.codigo;

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante
SELECT a.fabricante, AVG(a.precio) FROM articulos a 
	GROUP BY a.fabricante;

-- 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante
SELECT f.nombre AS fabricante, AVG(a.precio) AS precio_medio
	FROM articulos a
	INNER JOIN fabricantes f on a.fabricante=f.codigo
	GROUP BY a.fabricante;

-- 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €
SELECT f.nombre AS fabricante
	FROM articulos a
    INNER JOIN fabricantes f on a.fabricante=f.codigo
    GROUP BY a.fabricante
    HAVING AVG(a.precio) >=150;

-- 1.15. Obtener el nombre y el precio del artículo más barato
SELECT a.nombre AS articulos, a.precio
	FROM articulos a
    ORDER BY precio
    LIMIT 1;
SELECT a.nombre AS articulo, a.precio
	FROM articulos a
	WHERE a.precio = (SELECT MIN(precio) FROM articulos);

-- 1.16. Obtener una lista con el nombre y precio de los artículos más caros de cada provoeedor (incluyendo el nombre del proveedor)
SELECT f.nombre AS proveedor, a.nombre AS articulo_mas_caro, a.precio
	FROM articulos a
    INNER JOIN fabricantes f ON f.codigo=a.fabricante
    WHERE a.precio = (
		SELECT max(precio) FROM articulos a2
		WHERE a2.fabricante=a.fabricante
    );

-- 1.17. Añadir un nuevo producto: Altavoz de 70 € (del fabricante 2)
INSERT INTO articulos (codigo, nombre, precio, fabricante)
	VALUES (11, "Altavoz", 70, 2);

-- 1.18. Cambiar el nombre del producto 8 a 'Impresora Laser'
UPDATE articulos
	SET nombre="Impresora Laser"
	WHERE codigo=8;

-- 1.19. Aplicar un descuento del 10 % (multiplicar el precio por 0.9) a todos los productos
SELECT nombre AS articulo, precio*0.9 AS precio_con_descuento
	FROM articulos;
 
-- 1.20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual a 120 €
SELECT nombre AS articulo, 
	IF(precio >= 120, precio-10, precio) AS precio_actualizado
	FROM articulos;
	
