USE tienda;
SHOW TABLES;
SELECT * FROM empleado;
SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%a';
SELECT * FROM empleado WHERE nombre LIKE 'M%a';

-- GROUP BY

SELECT nombre, ROUND(AVG(precio),2) AS precio_promedio, COUNT(*) AS cantidad 
FROM articulo 
GROUP BY  nombre;

select nombre, count(*) from puesto group by nombre having count(*) >= 2;












