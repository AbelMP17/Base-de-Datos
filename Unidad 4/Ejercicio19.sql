SELECT nombre, 
       CONCAT(apellido1,' ',apellido2) AS apellidos, 
       DATEDIFF(CURDATE(), fecha_nacimiento) as dias_vividos 
FROM asistente;