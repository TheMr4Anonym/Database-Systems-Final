SELECT 
    e.continent,
    CAST(AVG(s.solar_share_elec) AS NUMERIC(10, 2)) AS avg_solar,
    CAST(AVG(w.wind_share_elec) AS NUMERIC(10, 2)) AS avg_wind,
    CAST(AVG(h.hydro_share_elec) AS NUMERIC(10, 2)) AS avg_hydro
FROM encompasses e
JOIN solarenergy s ON e.country = s.code
JOIN windenergy w ON e.country = w.code AND s.year = w.year
JOIN hydroenergy h ON e.country = h.code AND s.year = h.year
WHERE s.year = 2022
GROUP BY e.continent;
