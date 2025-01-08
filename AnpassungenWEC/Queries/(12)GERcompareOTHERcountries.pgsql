SELECT 
    c.name AS country_name,
    a.year,
    a.renewables_share_elec AS renewables_share,
    em.carbon_intensity_elec AS carbon_intensity
FROM allrenewables a
JOIN emissions em ON a.code = em.code AND a.year = em.year
JOIN country c ON a.code = c.code
WHERE c.name IN ('Germany', 'United States', 'China', 'India', 'Russia', 'Brazil') 
AND renewables_share_elec IS NOT NULL
AND carbon_intensity_elec IS NOT NULL
ORDER BY a.year, c.name;