-- this query shows the most common payment methods for Chicago taxi rides after 2020
-- in the last 3 years (2020-2023), card and cash are the most common payment methods
SELECT
  payment_type AS payment,
  COUNT(*) AS total_number
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE EXTRACT(YEAR FROM trip_start_timestamp) > 2020
  AND payment_type != 'Unknown' 
  AND payment_type != 'No Charge' 
  AND payment_type IS NOT NULL
GROUP BY 1
ORDER BY 2 desc;