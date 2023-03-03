-- Apartado a)
CREATE DATABASE centro;

USE centro;

CREATE TABLE profesor(
	nif VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	telefono varchar(9),
	sueldo DECIMAL(6,2) CHECK(sueldo BETWEEN 1500 AND 2000),
	especialidad VARCHAR(30),
	fecha_alta DATE	
);

CREATE TABLE modulo(
	codigo CHAR(5) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200),
	horas TINYINT CHECK(horas<=300),
	nif_profesor VARCHAR(9) NOT NULL,
	FOREIGN KEY(nif_profesor) REFERENCES profesor(nif)
);

CREATE TABLE alumno(
	num_expediente CHAR(5) PRIMARY KEY,
	nif VARCHAR(9) NOT NULL,
	nombre VARCHAR(50) NOT NuLL,
	apellidos VARCHAR(100) NOT null,
	domicilio VARCHAR(100),
	poblacion VARCHAR(100),
	cod_postal VARCHAR(5),
	provincia VARCHAR(100),
	telefono VARCHAR(9) NOT NULL,
	sexo ENUM('H','M') DEFAULT('H') NOT NULL,
	fec_nacimiento DATE NOT null
);

CREATE TABLE matricula(
	expediente_alumno CHAR(5) NOT null,
	cod_modulo CHAR(5) NOT null,
	curso_escolar INT,
	nota TINYINT(2),
	PRIMARY KEY(expediente_alumno, cod_modulo,curso_escolar),
	FOREIGN KEY(expediente_alumno) REFERENCES alumno(num_expediente),
	FOREIGN KEY(cod_modulo) REFERENCES modulo(codigo)
);

-- Apartado b)
ALTER TABLE profesor MODIFY sueldo DECIMAL(6,2);

ALTER TABLE modulo DROP descripcion;

ALTER TABLE profesor ADD cargo VARCHAR(20);

ALTER TABLE matricula MODIFY nota DECIMAL(4,2) UNSIGNED not null CHECK(nota BETWEEN 0 AND 10);

CREATE INDEX indiceAlumno ON alumno (nombre);

RENAME TABLE modulo TO asignatura;

ALTER TABLE profesor CHANGE sueldo salario DECIMAL(4,2);

-- NO

--ALTER TABLE alumno MODIFY sexo CHECK(sexo in('H','M'));