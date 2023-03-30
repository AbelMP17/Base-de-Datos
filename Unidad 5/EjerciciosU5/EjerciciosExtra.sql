/*Ejercicio 13. Borrar el cliente que menor límite de crédito tenga. ¿Es posible borrarlo? ¿Por qué?*/
DELETE FROM cliente
WHERE limite_credito=(SELECT MIN(limite_credito)
                       FROM cliente);

-- No seria posible, ya que este tiene asociado la tabla pago
/****************************************************************************************************/