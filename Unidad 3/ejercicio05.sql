--Apartado a:
CREATE USER centro IDENTIFIED BY 'centro';

--Apartado b:
SHOW GRANTS FOR centro;

--Apartado c:
--No, ya que dicho usuario ha sido creado sin privilegios.

--Apartado d:
GRANT SELECT ON centro.modulo;

--Apartado e:
--Si, ya que le hemos concedido el permiso de consulta.

--Apartado f:
--No, ya que no le hemos dado permiso como para hacer dicha acción.

--Apartado g:
GRANT INSERT ON centro.* TO centro;

--Apartado h:
SHOW GRANTS FOR centro;
--Se muestran todas las tablas de la base de datos.
--No, ya que solo tiene el permiso de SELECT en la tabla MODULO 

--Apartado i:
--No se puede en mariaDB ya que le hemos dado permisos a toda la tabla
--Por lo tanto deberiamos de revocar todas las tablas.

--Apartado j:
REVOKE SELECT ON centro.modulo FROM centro;
GRANT SELECT(codigo, nombre) ON centro.modulo TO centro;

--Apartado K:
GRANT CREATE ON centro to centro;

--Apartado l:
SET PASSWORD centro = PASSWORD 'centro1';

--Apartado m:
REVOKE ALL PRIVILGES GRANT OPTION FROM centro;

--Apartado n:
GRANT ALL ON centro TO centro WITH OPTION;

--Apartado o:
DROP USER centro;