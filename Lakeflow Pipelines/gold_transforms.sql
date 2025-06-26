CREATE OR REPLACE TEMPORARY VIEW baggage_data_transformed AS
  SELECT 
    bag_id,
    passenger_id,
    flight_id,
    weight_kg,
    status ,
    event_time,
    ROW_NUMBER() OVER (PARTITION BY bag_id ORDER BY event_time DESC) AS rn
  FROM live.baggage_events;
  
CREATE OR REPLACE LIVE TABLE gshen_catalog.yvr_airport.bag_status AS
  SELECT 
    bag_id,
    passenger_id,
    flight_id,
    weight_kg,
    event_time,
    status as current_status
  FROM live.baggage_data_transformed
  where rn = 1;

CREATE OR REPLACE LIVE TABLE gshen_catalog.yvr_airport.bag_weight_aggregate AS
  SELECT 
    weight_kg,
    COUNT(*) AS bag_count,
    AVG(weight_kg) AS avg_weight,
    SUM(weight_kg) AS total_weight
  FROM live.baggage_data_transformed
  GROUP BY weight_kg;



