WITH RankedCountries AS (
    SELECT 
        e.continent,
        c.name AS country_name,
        MAX(a.renewables_share_elec) AS max_renewables,
        ROW_NUMBER() OVER (PARTITION BY e.continent ORDER BY MAX(a.renewables_share_elec) DESC) AS rank
    FROM allrenewables a
    JOIN country c ON a.code = c.code
    JOIN encompasses e ON a.code = e.country
    WHERE a.year = 2022 AND a.renewables_share_elec IS NOT NULL
    GROUP BY e.continent, c.name
)
SELECT 
    continent, 
    country_name, 
    max_renewables
FROM RankedCountries
WHERE rank <= 5
ORDER BY continent, max_renewables DESC;
