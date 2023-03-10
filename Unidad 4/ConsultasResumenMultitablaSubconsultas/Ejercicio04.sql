/*4. Devolver un listado con los 20 productos más vendidos
junto al número total de unidades vendidas de aquellos
pedidos realizados entre el “01/04/2008” y el
“31/01/2009” cuyo estado se encuentre en entregado. El
listado se debe ordenar por el número total de unidades
vendidas de forma descendente.*/

SELECT DISTINCT producto.nombre, SUM(cantidad) AS "Total Unidades Vendidas"
FROM producto JOIN detalle_pedido USING(codigo_producto)
                JOIN pedido USING(codigo_pedido)
                WHERE (fecha_pedido BETWEEN "2008-04-01" AND "2009-01-31") AND estado="Entregado"
                GROUP BY producto.nombre ORDER BY 2 DESC LIMIT 20;