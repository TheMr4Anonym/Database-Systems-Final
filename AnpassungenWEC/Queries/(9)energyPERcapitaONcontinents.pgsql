SELECT 
    encompasses.continent, 
    CAST(AVG(efficiency.energy_per_capita) AS NUMERIC(10, 2)) AS avg_energy_per_capita
FROM 
    efficiency
JOIN 
    encompasses ON efficiency.code = encompasses.country
GROUP BY 
    encompasses.continent;
