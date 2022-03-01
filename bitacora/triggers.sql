USE sistemacontrolcovid; -- Cambiar por el nombre de la base de datos


CREATE TABLE IF NOT EXISTS acciones( -- Crea la tabla acciones si no existe
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- id Auto incrementable y llave primaria
    usuario VARCHAR(50), -- Almacenaremos el nombre del usuario que realiza la acción
    fecha_hora DATETIME, -- Almacenaremos la fecha y hora en la que se realiza la acción
    accion_r varchar(30) -- Almacenaremos la acción realizada
);


CREATE TRIGGER eliminar  -- Crea el trigger llamado eliminar
AFTER -- Ejecuta el trigger después de
DELETE  -- Elimina un registro en
ON personas -- La tabla personas
FOR EACH ROW -- Para cada registro
INSERT INTO acciones -- Inserta en la tabla acciones
VALUES (NULL, -- El id lo genera la base de datos
(SELECT SYSTEM_USER()), -- Recupera el nombre del usuario que realiza la acción
(SELECT NOW()), -- Recupera la fecha y hora actual
'Eliminado'); -- Coloca la acción realizada


CREATE TRIGGER insertar -- Crea el trigger llamado insertar
AFTER  -- Ejecuta el trigger después de
INSERT -- Inserta un registro en
ON personas -- La tabla personas
FOR EACH ROW -- Para cada registro
INSERT INTO acciones -- Inserta en la tabla acciones
VALUES (NULL, -- El id lo genera la base de datos
(SELECT SYSTEM_USER()), -- Recupera el nombre del usuario que realiza la acción
(SELECT NOW()), -- Recupera la fecha y hora actual
'Insertado');-- Coloca la acción realizada


CREATE TRIGGER modificar -- Crea el trigger llamado modificar
AFTER -- Ejecuta el trigger después de
UPDATE -- Actualiza un registro en
ON personas -- La tabla personas
FOR EACH ROW  -- Para cada registro
INSERT INTO acciones -- Inserta en la tabla acciones
VALUES (NULL, -- El id lo genera la base de datos
(SELECT SYSTEM_USER()), -- Recupera el nombre del usuario que realiza la acción
(SELECT NOW()), -- Recupera la fecha y hora actual
'Actualizado'); -- Coloca la acción realizada

-- Insertamos un registro en la tabla acciones
INSERT INTO personas VALUES 
(NULL, 'Jesús Antonio', 'Mena', 'De la rosa', 'Hombre', '2000-10-01');

--modificamos el nombre con id 16 en la tabla personas
UPDATE personas SET nombre = 'Jesús' WHERE _idPersona = 16;

-- Eliminamos el registro con id 16 en la tabla personas
DELETE FROM personas WHERE _idPersona = 16;