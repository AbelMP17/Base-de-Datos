SELECT sexo, COUNT(sexo) AS sexo 
FROM asistente
GROUP BY sexo;