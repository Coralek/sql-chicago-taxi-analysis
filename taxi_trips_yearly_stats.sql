-- this query shows yearly Chicago taxi activity, including the number of active taxis, total rides, and estimated average daily trips
-- the average number of daily taxi trips has been going down every year, from around 75k rides per day in 2013 to about 18k in 2023, which is roughly a 76% drop. This likely reflects using more Uber-like apps or public transport
SELECT 
  EXTRACT(YEAR FROM trip_start_timestamp) AS year,
  COUNT(DISTINCT taxi_id) AS taxi_count,
  COUNT(*) AS rides_count_year,
  CEILING(COUNT(*) / 365) AS rides_avg_daily
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
GROUP BY 1
ORDER BY 1;