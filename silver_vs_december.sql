WITH t AS (
    SELECT 
        year,
        month,
        SUM(revenue) AS revenue
    FROM sales
    WHERE plan = 'silver'
    GROUP BY year, month
)

SELECT 
    year,
    month,
    revenue,
    december,
    ROUND(revenue * 100.0 / december) AS perc
FROM (
    SELECT 
        *,
        MAX(CASE WHEN month = 12 THEN revenue END)
            OVER (PARTITION BY year) AS december
    FROM t
) s
ORDER BY year, month;
