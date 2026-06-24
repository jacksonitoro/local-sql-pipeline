SELECT
    EXTRACT(HOUR FROM starttime) AS hour_of_day,
    COUNT(*) AS trip_count
FROM bikeshare_clean
GROUP BY hour_of_day
ORDER BY hour_of_day;