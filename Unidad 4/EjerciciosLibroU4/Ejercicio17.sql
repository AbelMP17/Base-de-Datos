SELECT id_ponente, RPAD(UPPER(nombre), 10, '*') AS nombre, 
       RPAD(UPPER(NVL(apellido1, '')), 10, '*') AS apellido1, 
       RPAD(NVL(UPPER(apellido2), '*****'), 10, '*') AS apellido2,
       CONCAT(RPAD(UPPER(NVL(apellido1, '')), 10, '*'), ' ', 
              RPAD(NVL(UPPER(apellido2), '*****'), 10, '*')) AS apellidos
FROM ponente
ORDER BY apellidos ASC;