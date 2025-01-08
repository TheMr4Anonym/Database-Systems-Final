SELECT 
    a.year,
    a.renewables_share_elec AS renewables_share,
    em.carbon_intensity_elec AS carbon_intensity
FROM allrenewables a
JOIN emissions em ON a.code = em.code AND a.year = em.year
WHERE a.code = 'D' AND em.carbon_intensity_elec IS NOT NULL
ORDER BY a.year;