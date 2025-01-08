SELECT 
    ar.year AS year, 
    SUM(ar.renewables_consumption) AS global_consumption
FROM 
    student69.allrenewables ar
WHERE 
    ar.renewables_consumption IS NOT NULL
GROUP BY 
    ar.year
ORDER BY 
    ar.year ASC;
