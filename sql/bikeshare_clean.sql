CREATE OR REPLACE TABLE bikeshare_clean AS
SELECT
    tripduration,
    starttime,
    stoptime,
    "start station id"      AS start_station_id,
    "start station name"    AS start_station_name,
    "start station latitude"  AS start_lat,
    "start station longitude" AS start_lng,
    "end station id"        AS end_station_id,
    "end station name"      AS end_station_name,
    "end station latitude"    AS end_lat,
    "end station longitude"   AS end_lng,
    bikeid,
    usertype,
    "birth year"            AS birth_year,
    gender
FROM bikeshare_raw
WHERE
    tripduration > 0
    AND "start station id" IS NOT NULL
    AND "end station id" IS NOT NULL;