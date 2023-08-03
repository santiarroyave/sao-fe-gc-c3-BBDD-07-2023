-- EJERCICIO 3
USE actividades;
SELECT * FROM salas;
SELECT * FROM peliculas;

-- 4.01. Mostrar el nombre de todas las peliculas
SELECT nombre FROM peliculas;

-- 4.02. Mostrar las distintas calificaciones de edad que existen
SELECT calificacionedad FROM peliculas
	GROUP BY calificacionedad;

-- 4.03. Mostrar todas las películas que no han sido calificadas
SELECT nombre FROM peliculas
	WHERE calificacionedad IS NULL;

-- 4.04. Mostrar todas las salas que no proyectan ninguna pelicula
SELECT codigo, nombre AS sala FROM salas
	WHERE pelicula IS NULL;

-- 4.05. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la pelíula
SELECT s.*, p.nombre AS nombre_pelicula, p.calificacionedad FROM salas s
	LEFT JOIN peliculas p
	ON s.pelicula = p.codigo;

-- 4.06. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala
SELECT * FROM peliculas p
	LEFT JOIN salas s
    ON p.codigo=s.pelicula;

-- 4.07. Mostrar los nombres de las películas que no se proyectan en ninguna sala
SELECT p.nombre FROM peliculas p
	LEFT JOIN salas s
    ON p.codigo=s.pelicula
    WHERE s.pelicula IS NULL;

-- 4.08. Añadir una nueva película "Uno, Dos, Tres", para mayores de 7 años
INSERT INTO peliculas (codigo, nombre, calificacionedad)
	VALUES (10, "Uno, Dos, Tres", "Mayor 7");
    -- (desconozco la nomenclatura, he puesto el del enunciado)

-- 4.09. Hacer constar que todas las películas no calificadas han sido calificadas "no recomendables para menores de 13 años"
UPDATE peliculas
	SET calificacionedad = "no recomendables para menores de 13 años"
    WHERE calificacionedad IS NULL;
	-- (desconozco la nomenclatura, he puesto el del enunciado)

-- 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los publicos
DELETE FROM salas WHERE codigo IN (SELECT codigo FROM peliculas WHERE calificacionedad = "G");
	-- (He supuesto que "G" se referia a todos los publicos, no sabia cual era)
