USE tienda;
-- Reto 1:

-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo 
WHERE nombre LIKE '%pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo 
WHERE nombre LIKE '%Cannelloni%';
 
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo 
WHERE nombre LIKE '%-%';

-- ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto 
WHERE nombre LIKE '%Designer%';

-- ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto 
WHERE nombre LIKE '%Developer%';

-- Reto 2:

-- ¿Cuál es el promedio de salario de los puestos?
SELECT ROUND(AVG(salario),2) AS "Promedio de Salario" 
FROM puesto;

-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo 
WHERE nombre LIKE "%pasta%";

-- ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) AS "Salario Minimo", MAX(salario) AS "Salario Máximo" 
FROM puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?

-- Opción 1
SELECT SUM(salario) AS "Suma de 5 Salarios" 
FROM puesto 
WHERE id_puesto > ((SELECT MAX(id_puesto) FROM puesto)-5);

-- Opción 2
SELECT SUM(salario) AS "Suma de 5 ultimos salarios" 
FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS last5Salario; 


-- Reto 3

-- ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre AS "Puesto", COUNT(*) AS "Registros" 
FROM puesto 
GROUP BY nombre;

-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre AS "Nombre", ROUND(SUM(salario),2) AS "Salario Total" 
FROM puesto 
GROUP BY nombre;

-- ¿Cuál es el número total de ventas por vendedor?
SELECT empleado.id_empleado AS "Id",empleado.nombre AS "Nombre", COUNT(*) AS "Ventas" FROM venta 
INNER JOIN empleado 
WHERE venta.id_empleado = empleado.id_empleado
GROUP BY empleado.id_empleado;

-- Sin Join
SELECT id_empleado AS "Id de Empleado", COUNT(*) AS "Ventas" 
FROM venta 
GROUP BY id_empleado;

-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo AS "Id de Articulo", COUNT(*) AS "Ventas" 
FROM venta 
GROUP BY id_articulo;

-- Retos Extra

-- Los puestos mas ocupados
SELECT id_puesto AS "Id de Puesto", COUNT(*) AS "Numero de Empleados"  
FROM empleado GROUP BY id_puesto
ORDER BY COUNT(*) DESC;

-- Los puestos peor pagados
SELECT * FROM puesto ORDER BY salario;

-- 10 mejores vendedores
SELECT id_empleado AS "Id de Empleado", COUNT(*) AS "Ventas" 
FROM venta 
GROUP BY id_empleado
ORDER BY COUNT(*) DESC
LIMIT 10;

-- 20 articulos peor vendidos

SELECT id_articulo AS "Id de Articulo", COUNT(*) AS "Ventas" 
FROM venta 
GROUP BY id_articulo
ORDER BY COUNT(*)
LIMIT 20;












