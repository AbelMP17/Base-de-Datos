/*8. Devolver un listado con los nombres de los clientes que han realizado algún
pedido pero no han realizado ningún pago. Ordenar el resultado por el nombre
de cliente de forma ascendente.*/

SELECT DISTINCT nombre_cliente
FROM cliente
JOIN pedido USING(id_cliente)
LEFT JOIN pago USING(id_cliente)
WHERE pago.id_cliente IS NULL
ORDER BY nombre_cliente ASC;
