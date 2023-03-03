-- Parte 2
-- Apartado a) 
ALTER TABLE CLIENTE ADD código_postal char(5) not null;

-- Apartado b)
ALTER TABLE CLIENTE DROP localidad;

-- Apartado c)
ALTER TABLE TRANSACCION MODIFY importe cantidad decimal(13,2) check (cantidad between -9999999999.99 and 9999999999.99);

-- Apartado d)
CREATE INDEX indice_cliente ON CLIENTE (nombre);

-- Apartado e)
ALTER TABLE CLIENTE MODIFY sexo enum('H','M','SI') not null;

-- Apartado f)
ALTER TABLE cliente ADD telefono int(9) unsigned not null;

-- Apartado g) 
ALTER TABLE CLIENTE_CUENTA ADD FOREIGN KEY (idCliente) REFERENCES cliente(idCliente) ON UPDATE CASCADE;

-- Apartado h)
/*
No ya que para quitar una restriccion tienes que quitar todas.
*/
