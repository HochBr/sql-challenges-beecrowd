SELECT d.queue,
       d.esquerda AS "left",
       d.direita AS "right"
FROM (
    SELECT queue,
           id AS "esquerda",
           LEAD(id, 1) OVER(PARTITION BY queue ORDER BY id) AS "direita",
           available AS "esquerda_livre",
           LEAD(available, 1) OVER(PARTITION BY queue ORDER BY id) AS "direita_livre"
    FROM chairs
) AS d
WHERE d.esquerda_livre = TRUE
  AND d.direita_livre = TRUE;
