/*39. Realizar una consulta que muestre el total de gratificaciones recibidas por cada uno de los ponentes.*/

-- Con JOIN --
SELECT  nombre, apellido1, apellido2, SUM(participar.gratificacion) AS gratificaciones
FROM ponente JOIN participar ON(ponente.codigo = participar.codPonente)
            GROUP BY nombre, apellido1, apellido;SELECT * FROM `asistente`