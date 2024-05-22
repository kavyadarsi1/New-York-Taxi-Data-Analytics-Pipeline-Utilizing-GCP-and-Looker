CREATE OR REPLACE TABLE `newyork-data-project.newyork_dataengineering.table_analytics` as(
select
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pi.pickup_latitude,
pi.pickup_longitude,
dr.dropoff_latitude,
dr.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount,



from `newyork-data-project.newyork_dataengineering.fact_table` f
join `newyork-data-project.newyork_dataengineering.datetime_dim` d on f.datetime_id = d.datetime_id
join `newyork-data-project.newyork_dataengineering.passenger_count_dim` p on f.passenger_count_id = p.passenger_count_id
join `newyork-data-project.newyork_dataengineering.trip_distance_dim` t on t.trip_distance_id = f.trip_distance_id
join `newyork-data-project.newyork_dataengineering.rate_code_dim` r on r.rate_code_id = f.rate_code_id
join `newyork-data-project.newyork_dataengineering.pickup_location_dim` pi on pi.pickup_location_id = f.pickup_location_id
join `newyork-data-project.newyork_dataengineering.dropoff_location_dim` dr on dr.dropoff_location_id = f.dropoff_location_id
join `newyork-data-project.newyork_dataengineering.payment_type_dim` pay on pay.payment_type_id = f.payment_type_id);
