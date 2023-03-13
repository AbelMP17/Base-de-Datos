/*1. Obtener un listado con los clientes cuyo limite de crédito esté comprendido entre 5000 y 10000, su linea_direccion2 sea nula, su nombre contenga el caracter 'a'
 y su region toma el valor nulo se muestre "sin region". Ordenar de forma descendente por nombre de cliente. limitar los resultados a 5 comenzando desde la fila 3*/
SELECT nombre_cliente, linea_direccion2, NVL(region, "Sin Region") AS region, limite_credito
FROM cliente
WHERE limite_credito BETWEEN 5000 AND 10000 AND nombre_cliente LIKE '_a%' AND linea_direccion2 IS NULL
ORDER BY nombre_cliente DESC
LIMIT 1,8;

/*2. Quiero obtener un listado con la gama de productos que no tienen ningun producto asociado*/
SELECT DISTINCT gama, producto.codigo_producto
FROM gama_producto LEFT JOIN producto USING(gama)
WHERE codigo_producto IS NULL;

-- Con subconsultas
SELECT DISTINCT gama
FROM gama_producto WHERE gama NOT IN(SELECT gama
                                            FROM producto);

-- Con EXCEPT
SELECT gama FROM gama_producto
EXCEPT
SELECT gama FROM producto;

/*3. Quiero un listado de los clientes que han pedido algun producto de los que el stock sea maximo.*/
SELECT DISTINCT nombre_cliente
FROM cliente JOIN pedido USING(id_cliente)
            JOIN detalle_pedido USING(codigo_pedido)
WHERE codigo_producto IN(SELECT codigo_producto
                        FROM producto
                        WHERE cantidad_en_stock =(SELECT MAX(cantidad_en_stock)
                                                FROM producto));

-- Con subconsultas
SELECT DISTINCT nombre_cliente
FROM cliente 
WHERE id_cliente IN(SELECT id_cliente
                    FROM pedido
                    WHERE codigo_pedido IN(SELECT codigo_pedido
                                            FROM detalle_pedido
                                            WHERE codigo_producto IN(SELECT codigo_producto
                                                                    FROM producto
                                                                    WHERE cantidad_en_stock =(SELECT MAX(cantidad_en_stock)
                                                                                                FROM producto))))
ORDER BY nombre_cliente;