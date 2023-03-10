/*6. Devolver el nombre del cliente con menor límite de crédito de la región de
“Barcelona” (no se puede utilizar LIMIT ni ORDER BY en la sentencia SELECT).*/

SELECT nombre_cliente
FROM cliente
WHERE limite_credito IN (SELECT MIN(limite_credito)
                            FROM cliente
                            WHERE region="Barcelona");