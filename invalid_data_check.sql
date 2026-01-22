-- this query checks how many records may be noise or invalid data
-- around 20% of trips have 0 miles and about 5% of trips have 0 seconds duration
SELECT
  ROUND(100 * COUNTIF(trip_miles = 0) / COUNT(*), 2) AS zero_miles,
  ROUND(100 * COUNTIF(trip_seconds = 0) / COUNT(*), 2) AS zero_seconds
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;