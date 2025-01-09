SELECT 
    c.name AS country_name, 
    MAX(h.hydro_share_elec) AS max_hydro_share
FROM 
    hydroenergy h
JOIN 
    country c
ON 
    h.code = c.code
WHERE 
    h.hydro_share_elec IS NOT NULL
GROUP BY 
    c.name
ORDER BY 
    max_hydro_share DESC
LIMIT 10;

-- Czech Republic stimmt nicht!
