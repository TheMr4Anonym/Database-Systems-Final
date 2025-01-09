SELECT 
    c.name AS country_name, 
    MAX(o.other_renewables_share_elec) AS max_other_renewables_share
FROM 
    otherrenewables o
JOIN 
    country c
ON 
    o.code = c.code
WHERE 
    o.other_renewables_share_elec IS NOT NULL
GROUP BY 
    c.name
ORDER BY 
    max_other_renewables_share DESC
LIMIT 5;
