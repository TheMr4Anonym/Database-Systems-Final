SELECT c.name AS country_name, MAX(s.solar_share_elec) AS max_solar_share
FROM solarenergy s
JOIN country c
ON s.code = c.code
WHERE s.solar_share_elec IS NOT NULL
GROUP BY c.name
ORDER BY max_solar_share DESC
LIMIT 5;
