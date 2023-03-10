/*9. Obtener el total facturado por producto (únicamente se deben
tener en cuenta los pedidos realizados en el año 2009 y que se
encuentren en estado de entregados para el cálculo) del cliente
que tiene menor límite de crédito.*/

SELECT producto.nombre, SUM(detalle_pedido.cantidad * detalle_pedido.precio_unidad) AS total_facturado
FROM cliente
JOIN pedido USING(id_cliente)
JOIN detalle_pedido USING(codigo_pedido)
JOIN producto USING(codigo_producto)
WHERE cliente.limite_credito =(SELECT MIN(limite_credito) 
                                FROM cliente)
                        AND pedido.fecha_pedido >= '2009-01-01' AND pedido.fecha_pedido <= '2009-12-31'
                        AND pedido.estado = 'Entregado'
                        GROUP BY producto.nombre;