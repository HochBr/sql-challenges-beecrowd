--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2740

CREATE TABLE league(
  position INTEGER,
  team CHARACTER VARYING (255)
);


INSERT INTO league(position, team)
VALUES (1, 'The Quack Bats'),
       (2, 'The Responsible Hornets'),
       (3, 'The Bawdy Dolphins'),
       (4, 'The Abstracted Sharks'),
       (5, 'The Nervous Zebras'),
       (6, 'The Oafish Owls'),
       (7, 'The Unequaled Bison'),
       (8, 'The Keen Kangaroos'),
       (9, 'The Left Nightingales'),
       (10, 'The Terrific Elks'),
       (11, 'The Lumpy Frogs'),
       (12, 'The Swift Buffalo'),
       (13, 'The Big Chargers'),
       (14, 'The Rough Robins'),
       (15, 'The Silver Crocs');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE league; --

-- Básicamente os CTE criados são tabelas temporarias com os dados já "formatados"
-- WITH nome_da_cte AS(query)
WITH cte_primeiros AS ( -- Como a tabela já está ordenada então é só pego os 3 primeiros
    SELECT 'Podium: ' || team AS name -- Os || concatenam os dados
    FROM league
    LIMIT 3
), -- caso for usar mais de uma cte é só utilizar uma vírgula :)
  
cte_ultimos AS (
    SELECT 'Demoted: ' || team AS name
    FROM league
    ORDER BY position DESC 
    LIMIT 1
),
  
cte_penultimo AS ( -- Lembre de ler a CTE de baixo para cima
    SELECT 'Demoted: ' || team AS name
    FROM league
    WHERE position = (SELECT MAX(position) 
                      FROM league 
                      WHERE position < ( -- Com o uso do MAX a subquary(1) busca o maior valor que é menor que o valor obtido na subquary(2)
                                        SELECT MAX(position) FROM league) -- Está subquery(2) básicamente busca o maior valor 
                                       ) 
)

SELECT * FROM cte_primeiros
UNION ALL -- O UNION ALL de forma bem abstrata funciona como um concatenador de queries
SELECT * FROM cte_penultimo
UNION ALL
SELECT * FROM cte_ultimos;


