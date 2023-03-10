/*11. Obtener el nombre de los productos con mayor stock que compra un cliente
cuyo representante de ventas trabaje en la oficina de la ciudad de Madrid.*/

-- Esta mal
SELECT producto.nombre
FROM producto
JOIN detalle_pedido USING(codigo_producto)
JOIN pedido USING(codigo_pedido)
JOIN cliente USING(id_cliente)
JOIN empleado ON(cliente.id_empleado_rep_ventas = empleado.id_empleado)
JOIN oficina USING(codigo_oficina)
WHERE oficina.ciudad = 'Madrid'
    AND cliente.id_cliente IN(SELECT id_cliente
                                FROM pedido
                                GROUP BY id_cliente
                                ORDER BY SUM(cantidad) DESC)
ORDER BY detalle_pedido.cantidad DESC;
