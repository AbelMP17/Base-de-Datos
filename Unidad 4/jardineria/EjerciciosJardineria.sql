-- EJercicio 01
SELECT estado 
FROM pedido 
GROUP BY estado DESC;

-- Ejercicio 02
SELECT nombre, CONCAT_WS(" ",apellido1, NVL(apellido2,"")) AS apellidos, email 
FROM empleado 
WHERE puesto = "Director Oficina" AND codigo_oficina = "%-ES";

-- EJercicio 03
SELECT nombre, gama, cantidad_en_stock AS "Cantidad en stock" 
FROM producto 
WHERE descripcion = NULL AND precio_venta > 4 
ORDER BY nombre, cantidad_en_stock DESC LIMIT 3,5;

-- Ejercicio 04
SELECT nombre, CONCAT(ROUND((precio_venta-precio_proveedor)*1.21,2)," €") AS Beneficio 
FROM producto 
WHERE gama = "frutales" 
ORDER BY ROUND((precio_venta-precio_proveedor)*1.21,2) DESC LIMIT 5;

-- Ejercicio 05
SELECT UPPER(RPAD(nombre, 10, "#")) AS nombre, CONCAT_WS(" ",UPPER(apellido1), UPPER(NVL(apellido2,""))) AS apellidos, puesto
FROM empleado WHERE puesto NOT IN("Director Oficina","Representante Ventas") AND apellido1 LIKE "_o%";

-- Ejercicio 06
SELECT codigo_pedido, id_cliente, MONTHNAME(fecha_entrega) AS "MES",
DATE_FORMAT(fecha_esperada, '%d-%m-%y') AS "fecha_esperada",
DATE_FORMAT(fecha_entrega, '%d-%m-%y') AS "fecha_entrega"
FROM pedido WHERE comentarios IS NOT NULL AND DATEDIFF(fecha_esperada,fecha_entrega) >2
ORDER BY fecha_esperada DESC;

-- Ejercicio 07
SELECT id_cliente, SUM(total) AS total FROM pago WHERE YEAR(fecha_pago) = 2008 GROUP BY id_cliente HAVING SUM(total) >= 4000
ORDER BY total DESC;

-- Ejercicio 08
SELECT id_cliente, codigo_pedido AS "Pedidos rechazados"
FROM pedido
WHERE estado = "Rechazado" AND YEAR(fecha_esperada) = 2009 GROUP BY id_cliente ORDER BY "Pedidos rechazados" DESC, id_cliente ASC;

-- Ejercicio 09
SELECT YEAR(fecha_entrega) AS "Año", MONTH(fecha_entrega) AS "Mes", codigo_pedido
FROM pedido
WHERE MONTH(fecha_entrega) = 1 AND comentarios IS NULL AND estado = "Entregado" ORDER BY "Año" ASC;

-- Ejercicio 10 
SELECT id_cliente, SUM(total) AS "Acumulado"
FROM pago
WHERE forma_pago = "PayPal" AND fecha_pago BETWEEN "2007-01-08" AND "2009-02-16" AND Acumulado BETWEEN 5500 AND 15000 ORDER BY Acumulado;