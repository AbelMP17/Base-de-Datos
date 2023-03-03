SELECT nombre, CONCAT_WS(" ",apellido1, apellido2) AS apellidos
FROM asistente
JOIN asistir ON(asistente.codigo = asistir.codAsistente)
JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
WHERE referencia = "PWB1314";