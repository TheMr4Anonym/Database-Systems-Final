SELECT c.name, a.renewables_share_elec, e.net_elec_imports
FROM allrenewables a
JOIN energytrade e ON a.code = e.code AND a.year = e.year
JOIN country c ON a.code = c.code
WHERE a.year = 2022 AND renewables_share_elec IS NOT NULL
ORDER BY a.renewables_share_elec DESC;