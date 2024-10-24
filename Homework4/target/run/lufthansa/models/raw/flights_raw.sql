
  
    
    

    create  table
      "lh"."main_raw"."flights_raw__dbt_tmp"
  
    as (
        -- tells dbt how to create and store model in db

select
    flight_id,
    flight_number,
    origin_airport_code,
    destination_airport_code,
    scheduled_departure_time,
    scheduled_arrival_time,
    actual_departure_time,
    actual_arrival_time,
    aircraft_id,
    status
from main.raw_flights
    );
  
  