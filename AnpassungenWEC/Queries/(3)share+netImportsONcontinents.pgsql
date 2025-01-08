SELECT 
    e.continent, 
    ROUND(CAST(AVG(a.renewables_share_elec) AS numeric), 2) AS avg_renewables, 
    ROUND(CAST(AVG(et.net_elec_imports) AS numeric), 2) AS avg_imports
FROM allrenewables a
JOIN energytrade et ON a.code = et.code AND a.year = et.year
JOIN encompasses e ON a.code = e.country
GROUP BY e.continent;
