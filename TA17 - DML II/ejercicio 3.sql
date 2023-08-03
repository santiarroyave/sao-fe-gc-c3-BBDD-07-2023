-- EJERCICIO 3
USE actividades;
SELECT * FROM almacenes;
SELECT * FROM cajas;

-- 3.01. Obtener todos los almacenes
SELECT * FROM almacenes;

-- 3.02. Obtener todas las cajas cuyo contenido tenga un valor superior a 150 €
SELECT * FROM cajas
	WHERE valor > 150;
    
-- 3.03. Obtener los tipos de contenidos de las cajas
SELECT contenido AS tipos from cajas
	GROUP BY contenido;
    
-- 3.04. Obtener el valor medio de todas las cajas
SELECT AVG(valor) FROM cajas;

-- 3.05. Obtener el valor medio de las cajas de cada almacen
SELECT almacen, AVG(valor) AS valor_medio FROM cajas
	GROUP BY almacen;

-- 3.06. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 €
SELECT almacen FROM cajas
	GROUP BY almacen
    HAVING AVG(valor) > 150;
    
-- 3.07. Obtener el número de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra
SELECT c.numreferencia, a.lugar FROM cajas c
	INNER JOIN almacenes a
    ON a.codigo=c.almacen
    GROUP BY numreferencia;

-- 3.08. Obtener el numero de cajas que hay en cada almacen
SELECT almacen, count(*) AS cantidad FROM cajas
	GROUP BY almacen;

-- 3.09. Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad)
SELECT a.codigo, a.capacidad FROM almacenes a
	INNER JOIN cajas c ON a.codigo=c.almacen
    GROUP BY a.codigo
    HAVING count(*) > a.capacidad;
    
-- 3.10. Obtener los numeros de referencia de las cajas que están en Bilbao
SELECT c.numreferencia FROM cajas c
	WHERE (SELECT codigo FROM almacenes WHERE lugar = "Bilbao") = almacen;

-- 3.11. Insertar un nuevo almacén en Barcelona con capacidad para 3 cajas
INSERT INTO almacenes (codigo, lugar, capacidad)
	VALUES (6, "Barcelona", 3);

-- 3.12. Inserta una nueva caja, con número de referencia "H5RT", con contenido "Papel", valor 200, y situada en el almacén 2
INSERT INTO cajas (numreferencia, contenido, valor, almacen)
	VALUES ("H5RT", "Papel", 200, 2);

-- 3.13. Rebajar el valor de todas las cajas un 15%
UPDATE cajas
	SET valor = valor * 0.85;

-- 3.14. Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas
UPDATE cajas
	SET valor = valor * 0.8
    WHERE valor > (SELECT AVG(valor) FROM cajas);
   
-- 3.15. Elimina todas las cajas cuyo valor sea inferior a 100€
DELETE FROM cajas WHERE valor < 100;

-- 3.16. Vaciar el contenido de los almacenes que están saturados
DELETE FROM cajas
WHERE almacen IN (
    SELECT codigo FROM (
        SELECT a.codigo, COUNT(*) as num_cajas, a.capacidad
			FROM almacenes a
			INNER JOIN cajas c ON a.codigo = c.almacen
			GROUP BY a.codigo, a.capacidad
    ) AS subconsulta
    WHERE num_cajas > capacidad
);


