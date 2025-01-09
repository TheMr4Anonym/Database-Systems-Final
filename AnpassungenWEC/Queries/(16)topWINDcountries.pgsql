SELECT c.name AS country_name, MAX(w.wind_share_elec) AS max_wind_share
FROM windenergy w
JOIN country c
ON w.code = c.code
WHERE w.wind_share_elec IS NOT NULL
GROUP BY c.name
ORDER BY max_wind_share DESC
LIMIT 5;
