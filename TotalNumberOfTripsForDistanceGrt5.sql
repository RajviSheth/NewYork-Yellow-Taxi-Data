SELECT 
yt.vendor_name, trip_Pickup_year AS year,
 JSON_AGG(distinct yf.payment_type) AS payment_type,
 COUNT(yt.trip_distance) AS total_trips
FROM 
yellow_tripdata AS yt
LEFT JOIN
yellow_faredata AS yf
ON 
yt.trip_id = yf.trip_id
WHERE 
yt.Trip_Distance > 5
GROUP BY 
yt.vendor_name, year, payment_type
ORDER BY 
yt.vendor_name;
