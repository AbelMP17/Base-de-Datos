/*40. Realizar una consulta que muestre los asistentes a cada una de las conferencias que se celebran el día
“02/10/2013”. El resultado debe mostrarse ordenado por el tema de la conferencia, así como por los apellidos
y nombre de los asistentes.*/

-- Con JOIN --
SELECT asistente.*, tema
FROM asistente JOIN asistir ON(asistente.codigo = asistir.codAsistente)
                JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
                WHERE fecha = "2013-10-02"
                ORDER BY tema, apellido1, nombre;

-- Con Subconsultas --
SELECT *
FROM asistente WHERE codigo IN(SELECT codAsistente
                                FROM asistir
                                WHERE refConferencia IN(SELECT referencia
                                                        FROM conferencia
                                                        WHERE fecha="2013-10-02" ORDER BY tema))
                                                        ORDER BY apellido1, nombre;