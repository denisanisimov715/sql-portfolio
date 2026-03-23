SELECT
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev,
    ROUND(revenue * 100.0 / NULLIF(LAG(revenue) OVER (ORDER BY year, month), 0), 0) AS perc
FROM sales
WHERE tariff = 'gold'
  AND year = 2020
ORDER BY month;
