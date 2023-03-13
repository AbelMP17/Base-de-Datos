SELECT COUNT(DISTINCT sala) AS salas 
FROM conferencias 
GROUP BY turno;