# Chicago Taxi Trips Analysis

this project looks at the Chicago Taxi Trips public dataset using SQL in Google BigQuery.
the goal is to get a general understanding of the data, spot quality issues, and highlight a few clear trends in how taxi usage has changed over time.

## data source

[Chicago Taxi Trips Dataset](https://console.cloud.google.com/marketplace/product/city-of-chicago-public-data/chicago-taxi-trips)

## tl;dr

* each row represents one taxi trip in Chicago
* data spans from April 2014 to December 2023
* contains trip time, distance, location, fare, payment type, and company info
* the dataset has many missing and inconsistent values, so cleaning is needed
* taxi demand has dropped significantly over the years
* trips are getting longer in both distance and time
* the leading taxi company changes over time
* some pickup areas bring in higher average fares

## insights

- missing_values_check.sql
* this query checks missing values
* a large portion of records (over 36%) has missing pickup census tract

