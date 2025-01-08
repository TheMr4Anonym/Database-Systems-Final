SELECT c.name, e.net_elec_imports, MAX(s.solar_share_elec) AS solar, MAX(w.wind_share_elec) AS wind, MAX(h.hydro_share_elec) AS hydro
FROM energytrade e
JOIN solarenergy s ON e.code = s.code AND e.year = s.year
JOIN windenergy w ON e.code = w.code AND e.year = w.year
JOIN hydroenergy h ON e.code = h.code AND e.year = h.year
JOIN country c ON e.code = c.code
WHERE e.year = 2022
GROUP BY c.name, e.net_elec_imports
ORDER BY e.net_elec_imports ASC;