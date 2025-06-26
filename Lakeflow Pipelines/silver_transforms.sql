-- Table containing flight details with a constraint on the status field
CREATE LIVE TABLE flight_details(
  CONSTRAINT valid_status EXPECT (status IN ('On Time', 'Delayed', 'Cancelled'))
) AS
SELECT *
FROM gshen_catalog.yvr_airport.flight_details_yvr;

-- Table containing gate assignments with a constraint on the gate number field
CREATE LIVE TABLE gate_assignments(
  CONSTRAINT valid_gate_number EXPECT (gate_number IS NOT NULL)
) AS
SELECT *
FROM gshen_catalog.yvr_airport.gate_assignments_yvr;

-- Table containing passenger details with a constraint on the seat number field
CREATE LIVE TABLE passenger_details(
  CONSTRAINT valid_seat_number EXPECT (seat_number IS NOT NULL)
) AS
SELECT *
FROM gshen_catalog.yvr_airport.passenger_details_yvr;

-- Table containing baggage events with a constraint on the weight field
CREATE LIVE TABLE baggage_events(
  CONSTRAINT valid_weight EXPECT (weight_kg > 0),
  CONSTRAINT overweight EXPECT (weight_kg < 27)
) AS
SELECT *
FROM gshen_catalog.yvr_airport.baggage_data;

--
