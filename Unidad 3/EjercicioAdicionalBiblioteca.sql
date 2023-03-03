CREATE DATABASE Biblioteca;

USE Biblioteca;
CREATE TABLE Autor(
    IdAutor SMALLINT PRIMARY KEY,
    nombre varchar(50) not null,
    apellido varchar(100) not null,
    fechaNacimiento DATE not null
);

CREATE TABLE Libro(
    ISBN SMALLINT PRIMARY KEY,
    numeroPagina SMALLINT ,
    nombre varchar(50) not null,
    tematica varchar(100) not null
);
CREATE TABLE Usuario(
    idUsuario SMALLINT  PRIMARY KEY,
    nif char(9) not null,
    nombre varchar(50) not null,
    apellido varchar(100) not null,
    direccion varchar(100),
    telefono varchar(12) not null
);
CREATE TABLE Escribir(
    IdAutor SMALLINT,
    ISBN SMALLINT,
    PRIMARY KEY (IdAutor,ISBN),
    FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
);
CREATE TABLE Ejemplar(
    idEjemplar SMALLINT ,
    estadoConservacion varchar(50) not null,
    localizacion varchar(50) not null,
    ISBN SMALLINT ,
    PRIMARY KEY (idEjemplar,ISBN),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
);



CREATE TABLE Prestar(
    fechaPrestamo date not null,
    fechaDevolucion date not null,
    idUsuario SMALLINT ,
    idEjemplar SMALLINT ,
    ISBN SMALLINT ,
    PRIMARY KEY (fechaPrestamo,ISBN,idEjemplar,idUsuario),
    FOREIGN KEY (idEjemplar,ISBN) REFERENCES Ejemplar(idEjemplar, ISBN),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);