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

1. missing_values_check.sql
* this query checks missing values
* a large portion of records (over 36%) has missing pickup census tract

2. invalid_data_check.sql
* this query checks how many records may be noise or invalid data
* around 20% of trips have 0 miles and about 5% of trips have 0 seconds duration

3. taxi_trips_yearly_stats.sql
* this query shows yearly Chicago taxi activity, including the number of active taxis, total rides, and estimated average daily trips
* the average number of daily taxi trips has been going down every year, from around 75k rides per day in 2013 to about 18k in 2023, which is roughly a 76% drop. This likely reflects using more Uber-like apps or public transport

4. top_company_per_year.sql
* this query shows the top taxi company each year in Chicago based on total rides
* taxi company popularity changes over time between Taxi Affiliation Services (top 2013-2016 and 2019-2020) and Flash Cab (top 2017-2018 and 2021-2023)

5. top10_community_avg_profit.sql
* this query shows the top Chicago pickup community areas with the highest average profit per taxi ride
* pickup community area 76 has the highest average trip total per ride. This suggests trips from this area are usually longer or more expensive, so placing more taxis there could be more profitable

6. area76_top_census_avg_profit.sql
* this query shows the census tracts in community area 76 with the highest average profit per taxi ride
* within community area 76, census tract 17031980000 has the highest average trip total, around 48 USD per ride

7. yearly_avg_distance_time.sql
* this query shows how average taxi trip distance and trip time change year by year in Chicago
* average trip distance and duration increased over time, from about 3.9 miles and ~13 min in 2013 to about 7.3 miles and 22 min in 2023

8. payment_type_counts_post2020.sql
* this query shows the most common payment methods for Chicago taxi rides after 2020
* in the last 3 years (2020-2023), card and cash are the most common payment methods

9. yearly_avg_fare_rates.sql
* this query shows how average taxi fare per mile and per minute change year by year in Chicago.
* average fare per mile went down over time, especially compared to 2013 (from 5.7 to 3.4 per mile), while fare per minute stayed quite similar (~1 USD / min). TI think tis may mean that longer trips became cheaper per mile, and pricing depends more on time than distance