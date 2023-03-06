/*36. Realizar una consulta (utilizando subconsultas) que obtenga los distintos ponentes que han usado la sala
“Afrodita” para dar una conferencia*/
SELECT ponente.*
FROM ponente JOIN participar ON(ponente.codigo = participar.codPonente)
                JOIN conferencia ON(participar.refConferencia = conferencia.referencia)
WHERE sala IN(SELECT sala 
                FROM conferencia WHERE sala = "Afrodita");