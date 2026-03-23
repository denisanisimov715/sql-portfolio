WITH t2019 AS (
    SELECT
        quarter,
        SUM(revenue) AS prev
    FROM sales
    WHERE year = 2019
    GROUP BY quarter
),
t2020 AS (
    SELECT
        quarter,
        SUM(revenue) AS curr
    FROM sales
    WHERE year = 2020
    GROUP BY quarter
)
SELECT
    2020 AS year,
    t2020.quarter,
    t2020.curr AS revenue,
    t2019.prev,
    ROUND(t2020.curr * 100.0 / t2019.prev, 0) AS perc
FROM t2020
LEFT JOIN t2019
    ON t2020.quarter = t2019.quarter
ORDER BY t2020.quarter;

