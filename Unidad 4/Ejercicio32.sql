SELECT nombre, apellido1, apellido2, especialidad , tema, numOrden
FROM ponente
JOIN participar ON(ponente.codigo = participar.codPonente)
JOIN conferencia ON(participar.refConferencia = conferencia.referencia)
ORDER BY numOrden;