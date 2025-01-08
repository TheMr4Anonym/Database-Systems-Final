SELECT c.name, f.energy_per_capita, a.renewables_share_elec
FROM efficiency f
JOIN allrenewables a ON f.code = a.code AND f.year = a.year
JOIN country c ON f.code = c.code
WHERE f.year = 2022 AND energy_per_capita IS NOT NULL
ORDER BY f.energy_per_capita DESC;