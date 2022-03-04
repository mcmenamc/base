CREATE DATABASE bitacora;
GO
USE bitacora;
GO

CREATE TABLE personas(
	idPersonas INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(45),
	apellidoP VARCHAR(45), 
	apellidoM VARCHAR(45), 
	fechaNac DATE,
);
GO
CREATE TABLE acciones(
	idAcciones INT IDENTITY(1,1) PRIMARY KEY,
	usuario VARCHAR(45), 
	fecha DATETIME,
	registro VARCHAR(45)
);


GO



CREATE TRIGGER eliminar ON personas AFTER DELETE AS
BEGIN 
	INSERT INTO acciones VALUES(SYSTEM_USER, GETDATE(), 'Eliminado')
END;

GO

CREATE TRIGGER actualizar ON personas AFTER UPDATE AS
BEGIN 
	INSERT INTO acciones VALUES(SYSTEM_USER, GETDATE(), 'actualizar')
END;
GO

CREATE TRIGGER insertar ON personas AFTER INSERT AS
BEGIN 
	INSERT INTO acciones VALUES(SYSTEM_USER, GETDATE(), 'insertar')
END;

GO
INSERT INTO personas
VALUES( 'Jesús Antonio', 'Mena', 'De la rosa',  '2000-10-01');

GO
UPDATE personas SET nombre = 'Jesus' WHERE idPersonas = 2;
GO
DELETE FROM personas WHERE idPersonas = 2;
GO
SELECT * FROM acciones;

SELECT * FROM acciones;
