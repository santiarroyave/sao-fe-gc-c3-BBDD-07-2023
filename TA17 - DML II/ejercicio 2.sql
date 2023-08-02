-- EJERCICIO 2
USE actividades;
SELECT * FROM empleados;
SELECT * FROM departamentos;

-- 2.01. Obtener los apellidos de los empleados
SELECT apellidos FROM empleados;

-- 2.02. Obtener los apellidos de los empleados sin repeticiones
SELECT apellidos FROM empleados
	GROUP BY apellidos;

-- 2.03. Obtener todos los datos de los empleados que se apellidan "Smith"
SELECT * FROM empleados
	WHERE apellidos = "Smith";

-- 2.04. Obtener todos los datos de los empleados que se apellidan "Smith" y los que se apellidan "Rogers"
SELECT * FROM empleados
	WHERE apellidos IN ("Smith", "Rogers");

-- 2.05. Obtener todos los datos de los empleados que trabajan para el departamento 14
SELECT * FROM empleados
	WHERE departamento=14;

-- 2.06. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77
SELECT * FROM empleados
	WHERE departamento IN (37,77);

-- 2.07. Obtener todos los datos de los empleados cuyo apellido comience por "P"
SELECT * FROM empleados
	WHERE apellidos LIKE "p%";

-- 2.08. Obtener el presupuesto total de todos los departamentos
SELECT presupuesto FROM departamentos;

-- 2.09. Obtener el numero de empleados en cada departamento
SELECT departamento, COUNT(*) empleados FROM empleados
	GROUP BY departamento;

-- 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento
SELECT * FROM empleados e
	INNER JOIN departamentos d
    ON d.codigo=e.departamento;

-- 2.11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento
SELECT e.nombre, e.apellidos, d.nombre AS departamento, d.presupuesto
	FROM empleados e
    INNER JOIN departamentos d
    ON d.codigo=e.departamento;

-- 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €
SELECT e.nombre, e.apellidos
	FROM empleados e
    INNER JOIN departamentos d
    ON d.codigo=e.departamento
    WHERE presupuesto >= 60000;

-- 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos
SELECT * FROM departamentos
	WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

-- 2.14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen mas de dos empleados
SELECT d.nombre FROM departamentos d
	WHERE (SELECT COUNT(*) FROM empleados e WHERE e.departamento=d.codigo) > 2;

-- 2.15. Añadir un nuevo departamento: "Calidad", con presupuesto de 40.000 € y código 11.
		-- Añadir un empleado vinculado al departamento recien creado: Esther Vázquez, DNI: 89267109
INSERT INTO departamentos (codigo, nombre, presupuesto)
	VALUES(11, "Calidad",40000);
INSERT INTO empleados (dni, nombre, apellidos, departamento)
	VALUES(89267109, "Esther", "Vázquez", 11);

        
-- 2.16.
-- 2.17.
-- 2.18.
-- 2.19.
-- 2.20.