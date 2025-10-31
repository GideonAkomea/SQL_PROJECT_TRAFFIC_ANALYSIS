-- Average daily traffic per juction per month per year

WITH daily_totals AS (
    SELECT
        junction,
        DATE(datetime) AS date,
        EXTRACT(YEAR FROM datetime) AS year,
        TO_CHAR(datetime, 'Month') AS month,
        SUM(vehicles) AS daily_total
    FROM traffic
    GROUP BY
        junction,
        DATE(datetime),
        EXTRACT(YEAR FROM datetime),
        TO_CHAR(datetime, 'Month')
)
SELECT
    year,
    month,
    junction,
    ROUND(AVG(daily_total), 0) AS adt_per_month
FROM daily_totals
WHERE year = 2016 AND junction = 2
GROUP BY
    year,
    month,
    junction
ORDER BY
    ROUND(AVG(daily_total), 0) DESC
