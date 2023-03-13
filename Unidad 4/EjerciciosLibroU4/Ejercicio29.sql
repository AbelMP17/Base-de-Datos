SELECT nombre, referencia, tema
FROM ponente
JOIN participar ON (ponente.codigo = participar.codPonente)
JOIN conferencia ON (participar.refConferencia = conferencia.referencia);