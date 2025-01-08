SELECT 
    c.name AS country_name,
    c.area,
    a.renewables_share_elec AS renewables_share,
    em.carbon_intensity_elec AS carbon_intensity
FROM country c
JOIN allrenewables a ON c.code = a.code
JOIN emissions em ON c.code = em.code AND a.year = em.year
WHERE a.year = 2022
  AND c.area BETWEEN (SELECT area * 0.9 FROM country WHERE code = 'D')
                 AND (SELECT area * 1.1 FROM country WHERE code = 'D')
ORDER BY c.area DESC;