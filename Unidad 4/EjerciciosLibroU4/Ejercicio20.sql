SELECT nombre AS nombres, 
       CONCAT(apellido1,' ',apellido2) AS apellidos, 
       DAYOFWEEK(fecha_nacimiento) as dia_semana, 
       DAYOFYEAR(fecha_nacimiento) as dia_anio, 
       WEEK(fecha_nacimiento) as numero_semana 
FROM asistente;