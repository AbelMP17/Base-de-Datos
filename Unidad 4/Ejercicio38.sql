/*38. Realizar una consulta que muestre los asistentes que sean hombres y hayan nacido antes del “01/01/1985”, y
además hayan asistido a una conferencia sobre “Programación Web”.*/

-- Con JOIN --
SELECT asistente.* 
FROM asistente JOIN asistir ON(asistente.codigo = asistir.codAsistente)
                JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
                WHERE asistente.sexo = 'H' AND asistente.fechaNac < ("1985-01-01") AND conferencia.tema = "Programación Web";

-- Con Subconsultas --
SELECT asistente.* 
FROM asistente WHERE sexo = 'H' AND fechaNac < ("1985-01-01")
                AND codigo IN(SELECT codAsistente
                                FROM asistir 
                                WHERE refConferencia IN(SELECT referencia
                                                        FROM conferencia 
                                                        WHERE tema="Programación Web"));