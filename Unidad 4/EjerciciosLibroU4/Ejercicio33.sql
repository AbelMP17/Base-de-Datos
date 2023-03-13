SELECT tema, COUNT(*) AS numAsistentes, COUNT(sala) AS salas
FROM asistente
JOIN asistir ON(asistente.codigo = asistir.codAsistente)
JOIN conferencia ON(asistir.refConferencia = conferencia.referencia)
GROUP BY sala,tema ORDER BY numAsistentes;
