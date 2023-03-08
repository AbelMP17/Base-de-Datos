/*1. Realizar una consulta que devuelva el nombre de los clientes, el código de pedido y los días de retraso de aquellos pedidos que
no han sido entregados a tiempo (fecha de entrega superior a la fecha estimada y estado igual a entregado). Ordenar el
resultado por el código de pedido de forma ascendente*/

SELECT nombre_cliente, codigo_pedido, DATEDIFF(fecha_entrega,fecha_esperada) AS dias_retraso
FROM cliente JOIN pedido USING(id_cliente)
WHERE fecha_entrega > fecha_esperada AND estado = "Entregado" ORDER BY codigo_pedido ASC;