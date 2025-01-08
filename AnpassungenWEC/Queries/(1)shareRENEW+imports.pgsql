SELECT 
    c.name AS country_name,
    a.renewables_share_elec AS renewables_share_percent,
    et.net_elec_imports AS net_imports,
    CASE 
        WHEN et.net_elec_imports < 0 THEN 'exporting elec'
        ELSE 'importing elec'
    END AS trade_type
FROM 
    allrenewables a
JOIN 
    energytrade et ON a.code = et.code AND a.year = et.year
JOIN 
    country c ON a.code = c.code
WHERE 
    a.year = 2022 AND net_elec_imports IS NOT NULL 
ORDER BY 
    renewables_share_percent DESC;
