-- this query shows how average taxi trip distance and trip time change year by year in Chicago
-- average trip distance and duration increased over time, from about 3.9 miles and ~13 min in 2013 to about 7.3 miles and 22 min in 2023
SELECT
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  ROUND(AVG(trip_miles), 1) AS avg_trip_miles,
  ROUND(AVG(trip_seconds) / 60, 2) AS avg_trip_time_min,
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_miles > 0 AND trip_seconds > 0 -- remove possible data issues
GROUP BY 1
ORDER BY 1;