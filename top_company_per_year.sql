-- this query shows the top taxi company each year in Chicago based on total rides
-- taxi company popularity changes over time between Taxi Affiliation Services (top 2013-2016 and 2019-2020) and Flash Cab (top 2017-2018 and 2021-2023)
WITH yearly AS (
  SELECT
    EXTRACT(YEAR FROM trip_start_timestamp) AS year,
    company,
    COUNT(*) AS orders
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE company IS NOT NULL
  GROUP BY 1, 2
),
ranked AS (
  SELECT
    year,
    company,
    orders,
    ROW_NUMBER() OVER (PARTITION BY year ORDER BY orders DESC) AS rn
  FROM yearly
)
SELECT
  year,
  company,
  orders
FROM ranked
WHERE rn = 1
ORDER BY 1;