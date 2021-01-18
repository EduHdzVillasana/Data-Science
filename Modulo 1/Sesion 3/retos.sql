USE tienda;
-- RETO 1:
-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?

-- Cambie la cantidad por que no hay salarios menores a 10,000, lo cambie a 15,000
SELECT * 
FROM puesto
WHERE salario < 15000;

SELECT *
FROM empleado
WHERE id_puesto IN 
(SELECT id_puesto 
FROM puesto
WHERE salario < 15000);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT clave, id_empleado, COUNT(*) AS cantidad
FROM venta
GROUP BY  clave, id_empleado
ORDER BY cantidad DESC;

SELECT id_empleado, MIN(cantidad) AS cantidad_min, MAX(cantidad) AS cantidad_max
FROM
(SELECT clave, id_empleado, COUNT(*) AS cantidad
FROM venta
GROUP BY  clave, id_empleado
ORDER BY cantidad DESC) AS subconsulta
GROUP BY id_empleado;

-- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT * 
FROM articulo
WHERE precio > 5000;

SELECT clave 
FROM venta
WHERE id_articulo IN 
(SELECT id_articulo 
FROM articulo
WHERE precio > 5000);

-- RETO 2

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?

SELECT * FROM empleado;

SELECT empleado.nombre, venta.id_venta, venta.clave
FROM venta 
INNER JOIN empleado
ON venta.id_empleado = empleado.id_empleado;

-- ¿Cuál es el nombre de los artículos que se han vendido?
SELECT * FROM articulo;

SELECT articulo.nombre AS "Nombre de Articulo", venta.id_venta AS "Id Venta", venta.clave AS "Clave de Venta"
FROM venta
JOIN articulo
USING (id_articulo);


-- ¿Cuál es el total de cada venta?

SELECT clave, SUM(id_articulo) FROM venta GROUP BY clave;
DESCRIBE venta;
SELECT * FROM venta WHERE clave = "52125-277";

SELECT venta.clave, venta.fecha, sum(articulo.precio) AS "Total"
FROM venta
INNER JOIN articulo
ON venta.id_articulo = articulo.id_articulo
GROUP BY venta.clave, venta.fecha
ORDER BY venta.clave DESC;

-- RETO 3
-- Obtener el puesto de un empleado.
CREATE VIEW puestos_078 AS
SELECT empleado.nombre as nombre, empleado.apellido_paterno, puesto.nombre as puesto
FROM empleado
JOIN puesto
USING (id_puesto);

SELECT * FROM puestos_078;

-- Saber qué artículos ha vendido cada empleado.
CREATE VIEW articulos_por_empleado_078 AS
SELECT e.id_empleado, e.nombre, e.apellido_paterno, a.id_articulo
FROM empleado e
JOIN venta v
	ON e.id_empleado = v.id_empleado
JOIN articulo a 
	ON v.id_articulo = a.id_articulo
ORDER BY e.id_empleado;

SELECT * FROM articulos_por_empleado_078;

-- Saber qué puesto ha tenido más ventas.

CREATE VIEW ventas_por_puesto_078 AS
SELECT p.id_puesto, p.nombre, COUNT(*) as ventas
FROM venta v
JOIN empleado e 
	ON v.id_empleado = e.id_empleado
JOIN puesto p
	ON e.id_puesto = p.id_puesto
GROUP BY p.id_puesto
ORDER BY ventas DESC;

SELECT * FROM ventas_por_puesto_078;





