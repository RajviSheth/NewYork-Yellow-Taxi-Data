SELECT 
ytd.vendor_name AS VendorName, 
JSON_AGG(distinct yf.payment_type) AS PaymentType,
SUM(yf.total_amt) AS TotalAmount
FROM 
yellow_faredata AS yf
JOIN
yellow_tripdata AS ytd 
ON 
yf.trip_id = ytd.trip_id
GROUP BY 
ytd.vendor_name, yf.payment_id;
