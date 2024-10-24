
  
  create view "lh"."main_stage"."bookings_stg__dbt_tmp" as (
    

select
    booking_id,
    flight_id,
    passenger_id,
    booking_date,
    UPPER(booking_status) as booking_status,
    price
from "lh"."main_raw"."bookings_raw"
where booking_status is not null
  );
