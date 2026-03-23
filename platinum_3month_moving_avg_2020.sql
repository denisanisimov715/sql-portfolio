SELECT 
    year,
    month,
    revenue,
    ROUND(
        AVG(revenue) OVER (
            ORDER BY month
            ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
        ), 0
    ) AS avg3m
FROM sales
WHERE plan = 'platinum'
  AND year = 2020
ORDER BY month;
