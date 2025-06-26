CREATE LIVE TABLE gshen_catalog.yvr_airport.passenger_360 AS
SELECT
  p.passenger_id,
  p.name,
  p.flight_id,
  p.airline,
  p.origin,
  p.seat_number,
  f.scheduled_arrival,
  f.actual_arrival,
  g.gate_number,
  b.bag_id,
  b.weight_kg,
  b.current_status,
  b.event_time
FROM
  live.passenger_details p
    INNER JOIN live.flight_details f
      ON p.flight_id = f.flight_id
    INNER JOIN live.gate_assignments g
      ON p.flight_id = g.flight_id
    INNER JOIN gshen_catalog.yvr_airport.bag_status b
      on p.passenger_id = b.passenger_id



  