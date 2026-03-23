WITH t AS (
    SELECT 
        plan,
        year,
        month,
        revenue
    FROM convert_sales
    WHERE year = 2020
      AND month IN (1, 2, 3)
)

SELECT
    plan,
    year,
    month,
    revenue,
    SUM(revenue) OVER (
        PARTITION BY plan 
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS total
FROM t
ORDER BY plan, month;
