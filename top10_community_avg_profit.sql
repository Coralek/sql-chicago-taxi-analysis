-- this query shows the top Chicago pickup community areas with the highest average profit per taxi ride
-- pickup community area 76 has the highest average trip total per ride. This suggests trips from this area are usually longer or more expensive, so placing more taxis there could be more profitable
SELECT
  pickup_community_area AS community_area,
  ROUND(SUM(trip_total) / COUNT(*), 2) AS avg_profit_per_ride 
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE 
  pickup_community_area IS NOT NULL AND
  trip_total IS NOT NULL
GROUP BY 1
ORDER BY 2 desc
LIMIT 10;