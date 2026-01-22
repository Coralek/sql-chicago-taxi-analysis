-- this query shows how average taxi fare per mile and per minute change year by year in Chicago.
-- average fare per mile went down over time, especially compared to 2013 (from 5.7 to 3.4 per mile), while fare per minute stayed quite similar (~1 USD / min). TI think tis may mean that longer trips became cheaper per mile, and pricing depends more on time than distance
SELECT
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  ROUND(SUM(fare) / (SUM(trip_miles)), 1) AS avg_fare_mile,
  ROUND(SUM(fare) / (SUM(trip_seconds) / 60), 2) AS avg_fare_min,
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
GROUP BY 1
ORDER BY 1;