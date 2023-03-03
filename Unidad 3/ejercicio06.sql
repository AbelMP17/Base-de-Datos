-- Apartado a)
CREATE DATABASE hotel;

USE hotel;

CREATE TABLE reserva(
    idReserva int unsigned auto_increment primary key,
    fecha date not null,
    descripcion varchar(200)
);

CREATE USER pepe IDENTIFIED BY 'pepe1234';
--GRANT USAGE ON hotel TO pepe IDENTIFIED BY 'pepe1234';

-- Apartado b)
-- No puede hacer nada ya que no se le han dado permisos
-- No se le ha asignado ningun rol

-- Apartado c)
CREATE ROLE usuarioHotel;

GRANT UPDATE, INSERT, DELETE, SELECT ON hotel.* TO usuarioHotel;

-- Apartado d)
-- CREATE USER juan;
GRANT usuarioHotel TO juan;

-- Apartado e)
REVOKE UPDATE, INSERT, DELETE ON hotel.* TO usuarioHotel;
--GRANT SELECT ON hotel.reserva TO usuarioHotel;

-- No se puede ya que el rol de usuarioHotel ya no tiene ese permiso

-- Siendo root se puede ya que es el administrador

-- Apartado f)

DROP ROLE usuarioHotel;
-- Se puede y lo que sucede es que juan deja de tener ese rol