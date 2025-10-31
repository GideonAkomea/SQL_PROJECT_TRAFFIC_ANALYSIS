--hourly average traffic

SELECT
    junction,
    EXTRACT(YEAR FROM datetime) AS year,
    EXTRACT(HOUR FROM datetime) AS hour,
    ROUND(AVG(vehicles), 0) AS avg_hourly_vehicles
FROM traffic
GROUP BY
    junction,
    EXTRACT(YEAR FROM datetime),
    EXTRACT(HOUR FROM datetime)
ORDER BY
     ROUND(AVG(vehicles), 0) DESC;
