/*7. Devolver el nombre del producto del que se han vendido más unidades
(tener en cuenta que se tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido).*/

SELECT nombre
FROM producto
WHERE codigo_producto=(SELECT codigo_producto
                        FROM detalle_pedido
                        GROUP BY codigo_producto 
                        ORDER BY SUM(cantidad) DESC LIMIT 1);