SELECT nombre, COUNT(capacidad) AS numero_salas_capacitadas, capacidad FROM sala WHERE capacidad>=200;