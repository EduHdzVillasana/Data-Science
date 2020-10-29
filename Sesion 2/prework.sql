SELECT nombre FROM empleado WHERE nombre LIKE '%am%';

SELECT SUM(salario) AS "Nomina Total" FROM puesto;

SELECT CONCAT (empleado.nombre,' ',empleado.apellido_paterno, ' ',empleado.apellido_materno) AS "Nombre de Empleado", 
empleado.rfc AS "RFC", puesto.nombre AS "Puesto", puesto.salario AS "Sueldo" 
FROM empleado
INNER JOIN puesto
ON empleado.id_puesto = puesto.id_puesto;


SELECT puesto.nombre AS "Puesto", COUNT(*) AS "Total en Puesto" , SUM(puesto.salario) AS "Nomina Total de Puesto"
FROM empleado
INNER JOIN puesto
ON empleado.id_puesto = puesto.id_puesto
GROUP BY puesto.nombre
ORDER BY puesto.nombre;

SELECT CONCAT (empleado.nombre,' ',empleado.apellido_paterno, ' ',empleado.apellido_materno) AS "Nombre de Empleado", 
empleado.rfc AS "RFC", puesto.nombre AS "Puesto", puesto.salario AS "Sueldo", puesto.id_puesto AS "Id Puesto" 
FROM empleado
INNER JOIN puesto
ON empleado.id_puesto = puesto.id_puesto
WHERE puesto.nombre = "Account Coordinator";
