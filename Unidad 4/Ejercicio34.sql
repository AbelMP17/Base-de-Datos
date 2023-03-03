SELECT codigo,nombre,apellido1,apellido2, sala
FROM ponente
JOIN participar ON(ponente.codigo = participar.codPonente)
JOIN conferencia ON(participar.refConferencia = conferencia.referencia)
WHERE sala = "Afrodita";