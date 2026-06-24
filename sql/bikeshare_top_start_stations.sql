SELECT
    start_station_id,
    start_station_name,
    COUNT(*) AS trip_count
FROM bikeshare_clean
GROUP BY start_station_id, start_station_name
ORDER BY trip_count DESC
LIMIT 5;