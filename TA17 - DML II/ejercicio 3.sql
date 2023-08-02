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

-- 3.08. 
-- 3.09.
-- 3.10. 
-- 3.11. 
-- 3.12.  
-- 3.13. 
-- 3.14. 
-- 3.15. 
-- 3.16.  
