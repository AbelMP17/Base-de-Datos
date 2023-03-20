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
    nombre_fabricante VARCHAR(50) NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
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
-- Habria que desenlazarlo de la tabla producto, borrando todos los productos que hay dentro de ella que esten relacionados con el fabricante.

/*====================================================================================*/