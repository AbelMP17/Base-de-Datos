/*37. Realizar una consulta que muestre los asistentes de la empresa “BigSoft” que asisten a algunas de las sesiones
de la conferencia sobre “Programación Web”*/

-- Con JOIN --
SELECT asistente.* 
FROM asistente JOIN asistir ON(asistente.codigo = asistir.codAsistente)
                JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
                WHERE asistente.empresa = "BigSoft" AND conferencia.tema = "Programación Web";

-- Con Subconsultas --
SELECT *
FROM asistente
WHERE codigo IN(SELECT codAsistente
                FROM asistir 
                WHERE refConferencia IN(SELECT referencia
                                        FROM conferencia
                                        WHERE tema="Programación Web")) 
                                        AND empresa="BigSoft";