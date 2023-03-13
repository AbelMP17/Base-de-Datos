SELECT COUNT(sexo) AS 'Hombres', NVL(empresa, "Sin empresa asignada") AS empresa
FROM asistente
WHERE sexo = 'H' AND empresa IS NOT NULL GROUP BY empresa;