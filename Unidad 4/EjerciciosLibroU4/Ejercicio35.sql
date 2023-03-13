/*35. Realizar una consulta que seleccione los ponentes cuyo primer apellido sea igual al primer apellido del asistente
de menor edad.*/
SELECT *
FROM ponente
WHERE apellido1 IN(SELECT apellido1 
                    FROM asistente WHERE fechaNac = (SELECT MAX(fechaNac)
                                                        FROM asistente));