/*2. Realizar una consulta que muestre el nombre de cada empleado (aunque no tenga jefe), el nombre de su jefe y el nombre del jefe
de su jefe. En caso de no tener jefe debe mostrar el valor “SIN JEFE”.*/

SELECT empleado.nombre, jefe, superjefe
FROM empleado WHERE puesto IN(SELECT nombre
                                FROM empleado
                                WHERE );