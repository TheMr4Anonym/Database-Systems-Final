WITH yearly_emissions AS (
    SELECT 
        e.year AS year, 
        SUM(e.greenhouse_gas_emissions) AS global_emissions
    FROM 
        emissions e
    WHERE 
        e.greenhouse_gas_emissions IS NOT NULL
    GROUP BY 
        e.year
)
SELECT 
    year, 
    global_emissions, 
    CAST(((global_emissions - LAG(global_emissions) OVER (ORDER BY year)) / LAG(global_emissions) OVER (ORDER BY year) * 100) AS NUMERIC(10, 2)) AS growth_rate
FROM 
    yearly_emissions
ORDER BY 
    year ASC;
