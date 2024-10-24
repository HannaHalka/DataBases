
  
    
    

    create  table
      "lh"."main_mart"."flight_effectiveness__dbt_tmp"
  
    as (
      

with flight_bookings as (
    select
        b.flight_id,
        count(*) AS booked_seats
    from "lh"."main_stage"."bookings_stg" b
    group by b.flight_id
),
flight_capacity as (
    select
        f.flight_id,
        f.aircraft_id,
        a.capacity
    from "lh"."main_stage"."flights_stg" f
    INNER JOIN "lh"."main_stage"."aircrafts_stg" a ON f.aircraft_id = a.aircraft_id
)
select
    fc.flight_id,
    fc.aircraft_id,
    fc.capacity,
    fb.booked_seats,
    (fb.booked_seats::float / fc.capacity) * 100 AS effectiveness_percentage -- typecast to float
from flight_capacity fc
LEFT JOIN flight_bookings fb ON fc.flight_id = fb.flight_id
    );
  
  