-- Parte 1
create DATABASE BANCO;

USE Banco;

create TABLE CLIENTE(
    idCliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    DNI char(9) UNIQUE not null,
    nombre varchar(50) UNIQUE,
    direccion varchar(100),
    localidad varchar(100),
    fechaNac date, 
    sexo enum('H','M') not null
);

CREATE TABLE SUCURSAL(
    idSucursal SMALLINT UNSIGNED PRIMARY KEY check (idSucursal between 0 and 9999),
    nombre varchar(50) not null,
    direccion varchar(100),
    localidad varchar(100)
);

CREATE TABLE CUENTA(
    idSucursal SMALLINT UNSIGNED check (idSucursal between 0 and 9999),
    idCuenta SMALLINT UNSIGNED check (idSucursal between 0 and 999999),
    PRIMARY KEY (idCuenta, idSucursal),
    foreign KEY (idSucursal) references SUCURSAL (idSucursal)
);

CREATE TABLE TRANSACCION(
    idSucursal SMALLINT UNSIGNED check (idSucursal between 0 and 9999),
    idCuenta SMALLINT UNSIGNED check (idSucursal between 0 and 999999),
    numTransaccion SMALLINT UNSIGNED,
    fecha date DEFAULT current_date,
    importe decimal(13,2) check (importe between -9999999999.99 and 9999999999.99),
    PRIMARY KEY (idSucursal, idCuenta, numTransaccion),
    foreign KEY (idCuenta,idSucursal) references CUENTA (idCuenta,idSucursal),
    
);

CREATE TABLE CLIENTE_CUENTA(
    idSucursal SMALLINT UNSIGNED check (idSucursal between 0 and 9999),
    idCuenta SMALLINT UNSIGNED check (idSucursal between 0 and 999999),
    idCliente INT UNSIGNED,
    PRIMARY KEY (idSucursal, idCuenta, idCliente),
    foreign KEY (idCuenta,idSucursal) references CUENTA (idCuenta,idSucursal),
    foreign KEY (idCliente) references CLIENTE (idCliente)
);


