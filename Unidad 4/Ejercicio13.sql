SELECT tema, precio AS "Descuento 0%",precio-precio*0.05 AS "Descuento 5%",
precio-precio*0.1 AS "Descuento 10%", precio-precio*0.15 AS "Descuento 15%",
precio-precio*0.2 "Descuendo 20%" FROM conferencia;