-- peak day of the week per particular junction per particular year

WITH daily_totals AS (
    SELECT
        junction,
        DATE(datetime) AS date,
        EXTRACT(YEAR FROM datetime) AS year,
        TO_CHAR(datetime, 'Day') AS day_of_week,
        SUM(vehicles) AS daily_vehicles
    FROM traffic
    GROUP BY
        junction,
        DATE(datetime),
        EXTRACT(YEAR FROM datetime),
        TO_CHAR(datetime, 'Day')
)
SELECT
    junction,
    year,
    day_of_week,
    ROUND(AVG(daily_vehicles), 0) AS avg_peak_traffic
FROM daily_totals
WHERE year = 2016 AND junction = 1
GROUP BY
    junction,
    year,
    day_of_week
ORDER BY
    avg_peak_traffic DESC;


