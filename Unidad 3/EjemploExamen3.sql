-- Parte 3
-- Apartado a)
CREATE ROLE direccion, caja;

-- Apartado b)
GRANT SELECT,INSERT,UPDATE,DELETE ON BANCO.TRANSACCION to caja;
GRANT SELECT ON BANCO.SUCURSAL, BANCO.CUENTA, BANCO.CLIENTE_CUENTA, BANCO.CLIENTE to caja;

-- Apartado c)
GRANT SELECT,INSERT,UPDATE,DELETE on BANCO.* to direccion;

-- Apartado d)
--CREATE USER 'pepe' IDENTIFIED BY 'pepe';
GRANT direccion to 'pepe' IDENTIFIED BY 'pepe';
SET DEFAULT ROLE direccion FOR 'pepe';

--CREATE USER 'juan' IDENTIFIED BY 'juan';
GRANT caja to 'juan' IDENTIFIED BY 'juan';
SET DEFAULT ROLE caja FOR 'juan';

-- Apartado e)
DROP ROLE caja, direccion;

/*
Los usuarios no tendrian un rol definido.
*/