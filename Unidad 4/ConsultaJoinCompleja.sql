SELECT asistente.nombre CONCAT_WS(" ",asistente.apellido1, asistente.apellido2) AS apellidos
FROM asistente
JOIN asistir ON(asistente.codigo = asistir.codAsistente)
JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
JOIN participar ON(conferencia.referencia = participar.refConferencia)
JOIN ponente ON(participar.refConferencia = ponente.codigo)
WHERE ponente.nombre = "Kevin" AND ponente.apellido1 = "shull" AND sala = "Apolo";