-- Claro que o ideal seria dar um UPDATE com o CASE, 
-- entretanto assim podemos combrar toda a vez que o Zé Maria precisar ver os preços ;)
SELECT 
    p.name,
    CASE
        WHEN p.type = 'A' THEN 20.0
        WHEN p.type = 'B' THEN 70.0
        WHEN p.type = 'C' THEN 530.5
    END AS price
FROM products p
ORDER BY p.type, p.id DESC;
