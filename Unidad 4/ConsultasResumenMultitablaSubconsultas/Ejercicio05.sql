/*5. Sin hacer uso de subconsultas devolver un listado que muestre solamente
los empleados que no tienen un cliente asociado.*/

SELECT nombre, CONCAT_WS(" ", apellido1, apellido2) AS apellidos
FROM empleado LEFT JOIN cliente ON(empleado.id_empleado = cliente.id_empleado_rep_ventas)
                WHERE id_empleado_rep_ventas IS NULL;