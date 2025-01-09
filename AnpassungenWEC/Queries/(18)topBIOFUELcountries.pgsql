SELECT 
    c.name AS country_name, 
    MAX(b.biofuel_share_elec) AS max_biofuel_share
FROM 
    biofuelenergy b
JOIN 
    country c
ON 
    b.code = c.code
WHERE 
    b.biofuel_share_elec IS NOT NULL
GROUP BY 
    c.name
ORDER BY 
    max_biofuel_share DESC
LIMIT 5;
