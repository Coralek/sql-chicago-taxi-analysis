-- this query shows the census tracts in community area 76 with the highest average profit per taxi ride
-- within community area 76, census tract 17031980000 has the highest average trip total, around 48 USD per ride
SELECT
  pickup_census_tract AS census_track,
  ROUND(SUM(trip_total) / COUNT(*), 2) AS avg_profit_per_ride
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE pickup_community_area = 76
  AND pickup_census_tract IS NOT NULL
GROUP BY 1
ORDER BY 2 desc
LIMIT 10;