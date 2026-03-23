SELECT
    year,
    plan,
    SUM(revenue) AS revenue,
    SUM(SUM(revenue)) OVER (PARTITION BY year) AS total,
    ROUND(SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (PARTITION BY year), 0) AS perc
FROM sales
GROUP BY year, plan
ORDER BY year, plan;
