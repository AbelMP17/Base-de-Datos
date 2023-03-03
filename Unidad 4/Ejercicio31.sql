SELECT tema, COUNT(distinct nombre) AS numAsistentes
FROM asistente
JOIN asistir ON(asistente.codigo = asistir.codAsistente)
JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
GROUP BY tema;