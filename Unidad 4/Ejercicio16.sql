SELECT UPPER(nombre,apellido1,apellido2,especialidad), CONCAT(apellido1,' ',NVL(apellido2,'*****')) apellidos FROM ponente ORDER BY apellidos ASC;