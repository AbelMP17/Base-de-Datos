SELECT REPLACE(nombre, 'José', 'Pepe') as nombre, 
       CONCAT(apellido1,' ',apellido2) AS apellidos, 
       CHAR_LENGTH(nombre) + CHAR_LENGTH(apellido1) + CHAR_LENGTH(apellido2) as longitud 
FROM asistente;