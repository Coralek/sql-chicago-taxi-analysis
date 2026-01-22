-- this query checks missing values
-- a large portion of records (over 36%) has missing pickup census tract
SELECT
  COUNT(*) AS total_rows,
  ROUND(100 * COUNTIF(trip_start_timestamp IS NULL) / COUNT(*), 2) AS missing_start_time,
  ROUND(100 * COUNTIF(trip_end_timestamp IS NULL) / COUNT(*), 2) AS missing_end_time,
  ROUND(100 * COUNTIF(trip_miles IS NULL) / COUNT(*), 2) AS missing_trip_miles,
  ROUND(100 * COUNTIF(trip_seconds IS NULL) / COUNT(*), 2) AS missing_trip_seconds,
  ROUND(100 * COUNTIF(trip_total IS NULL) / COUNT(*), 2) AS missing_trip_total,
  ROUND(100 * COUNTIF(pickup_census_tract IS NULL) / COUNT(*), 2) AS missing_pickup_census,
  ROUND(100 * COUNTIF(pickup_community_area IS NULL) / COUNT(*), 2) AS missing_pickup_community,
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;