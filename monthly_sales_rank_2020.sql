WITH ranks AS (
    SELECT
        year,
        month,
        plan,
        RANK() OVER (PARTITION BY plan ORDER BY quantity DESC) AS rnk
    FROM sales
    WHERE year = 2020
)
SELECT
    year,
    month,
    MAX(CASE WHEN plan = 'silver' THEN rnk END) AS silver,
    MAX(CASE WHEN plan = 'gold' THEN rnk END) AS gold,
    MAX(CASE WHEN plan = 'platinum' THEN rnk END) AS platinum
FROM ranks
GROUP BY year, month
ORDER BY month;
