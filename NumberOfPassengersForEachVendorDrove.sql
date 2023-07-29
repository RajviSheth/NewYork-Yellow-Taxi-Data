SELECT 
vendor_name, year, 
MAX(total_passengers) AS total_passengers
FROM (
SELECT
vendor_name,
trip_pickup_day AS day_of_month,
trip_pickup_year  AS year, 
COUNT(passenger_count) AS total_passengers
FROM
yellow_tripdata
GROUP BY 
vendor_name, day_of_month, year) AS yt
GROUP BY 
vendor_name, year;
