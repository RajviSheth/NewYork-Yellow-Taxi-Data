SELECT vendor_name, pickup_date, yt_one.total_passengers FROM (
SELECT yt.vendor_name AS vn, yt.year as year, max(yt.total_passengers) AS total_passengers 
FROM ( SELECT
vendor_name, date(Trip_Pickup_DateTime) AS pickup_date,
trip_pickup_year AS year, COUNT(passenger_count) AS
total_passengers
FROM yellow_tripdata
GROUP BY vendor_name, year, pickup_date
) AS yt GROUP BY vn, year
) AS yt_one LEFT JOIN (
SELECT vendor_name, 
date(Trip_Pickup_DateTime) AS pickup_date,
trip_pickup_year AS year,COUNT(passenger_count) 
AS total_passengers
FROM YELLOW_TRIPDATA 
GROUP BY vendor_name, year, pickup_date
) AS yt_self 
ON yt_self.total_passengers = yt_one.total_passengers;