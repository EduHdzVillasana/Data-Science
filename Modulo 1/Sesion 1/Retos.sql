USE tienda;
-- Reto 1: 
-- Usando la base de datos tienda, muestra la descripción de las tablas articulo, puesto y venta.
-- Por cada tipo de dato que encuentras llena la siguiente tabla, a mano. Usa la Documentación de MySQL como referencia.
SHOW TABLES;
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;

-- Reto 2:
-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.

-- ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT nombre 
FROM empleado 
WHERE id_puesto = 4;

-- ¿Qué puestos tienen un salario mayor a $10,000?
SELECT * FROM puesto WHERE salario > 10000;

-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT * FROM articulo 
WHERE precio > 1000 AND iva < 100;

-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * FROM venta 
WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369);

-- Reto 3:
-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
SELECT * FROM puesto 
ORDER BY salario DESC 
LIMIT 5;