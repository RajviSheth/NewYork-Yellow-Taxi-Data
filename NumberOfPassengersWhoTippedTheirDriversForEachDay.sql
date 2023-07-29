SELECT 
yt.vendor_name,  
date(yt.Trip_Pickup_DateTime) AS  pickup_date,
count(yf.tip_amt) AS tip_count,
sum(yf.tip_amt) AS tip_amount,
FROM 
yellow_tripdata AS yt 
LEFT JOIN 
yellow_faredata AS yf 
ON 
yt.trip_id = yf.trip_id
WHERE 
yf.tip_amt<>0
GROUP BY 
pickup_date, yt.vendor_name 
ORDER BY
yt.vendor_name;
