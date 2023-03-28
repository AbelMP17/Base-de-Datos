/*1. Insertar un nuevo fabricante (por ejemplo, Apple) indicando su id y su nombre.*/
INSERT INTO fabricante VALUES(10,"Apple");

/*====================================================================================*/

/*2. Insertar dos nuevos fabricantes (por ejemplo, MSI y TP-Link) indicando solamente su nombre haciendo uso de una única sentencia SQL.*/
INSERT INTO fabricante(nombre) VALUES("MSI"),("TP-LINK");

/*====================================================================================*/

/*3. Insertar un nuevo producto (ver algún producto del fabricante en cuestión) asociado a uno de los nuevos
fabricantes. La sentencia de inserción debe incluir: id, nombre, precio e id_fabricante.*/
INSERT INTO producto VALUES(12,"Iphone 14 Pro Max",999,10);

/*====================================================================================*/

/*4. Insertar dos nuevos productos (ver productos del fabricante en cuestión) asociado a uno de los nuevos
fabricantes. La sentencia de inserción debe ser única e incluir: nombre, precio e id_fabricante.*/
INSERT INTO producto(nombre,precio,id_fabricante) VALUES("Router 20tp Pro",30,12), ("Portatil MSI",700,11);

/*====================================================================================*/

/*5. Crear una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas:
nombre_fabricante, nombre_producto y precio. Una vez creada la tabla insertar todos los registros de la BD
“tienda” en esta tabla haciendo uso de una única operación de inserción.*/
CREATE TABLE fabricante_productos(
    nombre_fabricante VARCHAR(30) NOT NULL,
    nombre_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(5,2) NOT NULL
);

INSERT INTO fabricante_productos SELECT fabricante.nombre, producto.nombre, precio FROM fabricante JOIN producto ON(fabricante.id = producto.id_fabricante);

/*====================================================================================*/

/*6. Crear una vista con el nombre vista_fabricante_productos que tenga las siguientes columnas:
nombre_fabricante, nombre_producto y precio.*/
CREATE VIEW vista_fabricante_productos AS SELECT * FROM fabricante_productos;

/*====================================================================================*/

/*7. Eliminar el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios se deberían realizar
para que fuese posible borrarlo?*/
-- Al no estar enlazada con la tabla producto se puede eliminar
DELETE FROM fabricante WHERE nombre="Xiaomi";

/*====================================================================================*/

/*8. Eliminar el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios se deberían realizar para
que fuese posible borrarlo?*/
DELETE FROM producto WHERE id_fabricante=1;
DELETE FROM fabricante WHERE nombre="Xiaomi";

-- Tambien podemos poner que se elimine en casdada
-- Para poder eliminarlo, debemos antes eliminar los productos de la tabla producto que esten relacionados.

/*====================================================================================*/

/*9. Actualizar el código del fabricante Huawei y asignarle el valor 30. ¿Es posible actualizarlo? Si no fuese posible,
¿qué cambios se deberían realizar para que fuese posible actualizarlo?*/
UPDATE fabricante SET id=30 WHERE nombre="Huawei";
/*Esta sentencia se puede actualizar sin problema ya que Huawei no tiene productos asociados*/

/*====================================================================================*/

/*10. Actualizar el código del fabricante Lenovo y asignarle el valor 20. ¿Es posible actualizarlo? Si no fuese posible,
¿qué cambios se deberían realizar para que fuese posible actualizarlo?*/
UPDATE fabricante SET id=20 WHERE nombre="Lenovo";
/*Este se debería de actualizar en cascada para que los productos que está enlazados actualicen su clave foranea*/

/*====================================================================================*/

/*11. Actualizar el precio de todos los productos sumándole 5 € al precio actual.*/
UPDATE producto SET precio = precio+5;

/*====================================================================================*/

/*12. Eliminar todas las impresoras que tienen un precio menor de 200 €.*/
DELETE FROM producto WHERE nombre LIKE "impresora" AND precio<200;

/*====================================================================================*/

/*13. Incrementar en un 5% el precio de los productos que pertenecen a los fabricantes en los que el nombre en su
segundo carácter tiene una “e”*/
UPDATE producto SET precio = precio * 1.05 WHERE id_fabricante IN(SELECT id 
                                                                    FROM fabricante
                                                                    WHERE nombre LIKE "_e%");

/*====================================================================================*/

/*14. Añadir un “*” al final del nombre del fabricante para aquellos en los que el precio medio de sus productos sea
superior a 200.*/
UPDATE fabricante SET nombre = CONCAT(nombre, '*') WHERE id IN ( SELECT id_fabricante 
                                                                FROM producto GROUP BY id_fabricante 
                                                                HAVING AVG(precio) > 200); 

/*15. Eliminar todos los fabricantes que no tienen productos asignados.*/
DELETE FROM fabricante WHERE nombre NOT IN (SELECT nombre_fabricante
                                            FROM fabricante_productos);

/*====================================================================================*/

/*16. Insertar un nuevo socio con los siguientes datos:*/
INSERT INTO socio VALUES (1007, "Francisco", "Sanchez", "Avda de las Palmeras, 2", "Armilla", "1970/02/02");

/*====================================================================================*/

/*17. Registrar el primer alquiler del socio 1007 que se lleva la copia 105 (correspondiente a la película "Lo
imposible") en la fecha actual (en la que se está haciendo la tarea). */
INSERT INTO alquiler (copia_pel, socio, fec_alquila) VALUES (105, 1007, CURDATE());

/*====================================================================================*/

/*18. Modificar el estado de la copia de la película con id 101 a "ESTROPEADA" incluyendo como observación
"Rayado".*/
UPDATE copia_pelicula SET estado = "ESTROPEADA" , observacion = "Rayado"
WHERE id_copia = 101;

/*====================================================================================*/

/*19. Eliminar la película cuyo título es "El Orfanato".*/
DELETE FROM pelicula WHERE titulo = "El Orfanato";

/*====================================================================================*/

/*20. Insertar una nueva película (inventando los datos) y después dar de alta dos copias para dicha película con el
estado "FUNCIONA".*/
INSERT INTO pelicula VALUES ("EN", "A Todo Gas", 109, 2010, "Accion");
INSERT INTO copia_pelicula  VALUES (120, "FUNCIONA", null, "EN"), (122, "FUNCIONA", null, "EN");

/*====================================================================================*/


/*21. Actualizar todas las películas que tengan como género "Animación" y reemplazarlo por "Dibujos".*/
UPDATE pelicula SET genero = "Dibujos"
WHERE genero = "Animacion";

/*====================================================================================*/

/*22. Eliminar aquellos socios cuya última película alquilada sea anterior al 1 de diciembre de 2014.*/
DELETE FROM socio
WHERE num_socio IN (SELECT socio
                    FROM alquiler
                    WHERE fec_devolucion < "2014-12-01");

/*====================================================================================*/

/*23. Incrementar en 20 céntimos el precio del alquiler a todas las películas que tengan más de dos copias.*/
UPDATE pelicula SET precio_alquiler = precio_alquiler + 0.20 WHERE codigo IN (SELECT pelicula
                                                                                FROM copia_pelicula
                                                                                GROUP BY pelicula
                                                                                HAVING COUNT(*) > 2);

/*====================================================================================*/

/*24. Eliminar todas las copias de las películas que contengan la palabra "FROZEN" y que su estado sea
"ESTROPEADA".*/
DELETE FROM copia_pelicula
WHERE estado LIKE "ESTROPEADA" AND pelicula IN (SELECT codigo
                                                FROM pelicula
                                                WHERE titulo LIKE "FROZEN");

/*====================================================================================*/