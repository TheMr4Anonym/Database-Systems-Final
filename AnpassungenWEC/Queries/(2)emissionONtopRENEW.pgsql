SELECT c.name, a.renewables_share_elec, em.carbon_intensity_elec
FROM allrenewables a
JOIN emissions em ON a.code = em.code AND a.year = em.year
JOIN country c ON a.code = c.code
WHERE a.year = 2022 AND renewables_share_elec IS NOT NULL
ORDER BY a.renewables_share_elec DESC;
