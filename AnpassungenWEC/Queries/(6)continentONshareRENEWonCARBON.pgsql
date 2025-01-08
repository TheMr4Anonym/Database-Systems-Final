SELECT 
    e.continent,
    ROUND(CAST(AVG(a.renewables_share_elec) AS numeric), 2) AS avg_renewables,
    ROUND(CAST(AVG(em.carbon_intensity_elec) AS numeric), 2) AS avg_carbon
FROM allrenewables a
JOIN emissions em ON a.code = em.code AND a.year = em.year
JOIN encompasses e ON a.code = e.country
WHERE a.year BETWEEN 2010 AND 2022
AND a.renewables_share_elec IS NOT NULL 
GROUP BY e.continent;
