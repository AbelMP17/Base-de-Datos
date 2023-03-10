/*10. Obtener los productos de la gama “Ornamentales” que tengan un precio de
venta mayor o igual al de todos los productos de la gama “Frutales” (no se
puede utilizar las funciones MAX y MIN, ni la cláusula ORDER BY).*/

SELECT DISTINCT nombre
FROM producto
WHERE gama = 'Ornamentales'
  AND producto.precio_venta >= ALL(SELECT precio_venta
                                    FROM producto
                                    WHERE gama = 'Frutales');