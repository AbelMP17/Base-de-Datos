/*3. Realizar una consulta que muestre las diferentes gamas de producto que
ha comprado cada cliente (no se deben mostrar las filas duplicadas) cuya
fecha de pedido esté comprendida entre el “10/01/2009” y el
“15/05/2009”, y el estado sea “entregado”. Ordenar los resultados por el
nombre del cliente y la gama de forma ascendente. Limitar el listado a
los 10 primeros resultados.*/


SELECT DISTINCT nombre_cliente, gama
FROM producto JOIN detalle_pedido USING(codigo_producto)
                JOIN pedido USING(codigo_pedido)
                JOIN cliente USING(id_cliente)
                WHERE (fecha_pedido BETWEEN "2009-01-10" AND "2009-05-15") AND estado="Entregado"
                ORDER BY nombre_cliente ASC LIMIT 10;