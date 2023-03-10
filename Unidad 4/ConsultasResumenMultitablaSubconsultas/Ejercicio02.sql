/*2. Realizar una consulta que muestre el nombre de cada empleado (aunque no tenga jefe), el nombre de su jefe y el nombre del jefe
de su jefe. En caso de no tener jefe debe mostrar el valor “SIN JEFE”.*/

SELECT empleado.nombre, NVL(jefe.nombre,"Sin_Jefe") AS Nombre_Jefe, NVL(superjefe.nombre,"Sin_Superjefe") AS Nombre_Superjefe
FROM empleado LEFT JOIN empleado AS jefe ON(jefe.id_empleado = empleado.id_jefe)
            LEFT JOIN empleado AS superjefe ON(superjefe.id_empleado = jefe.id_jefe);