
  
    
    

    create  table
      "lh"."main_raw"."bookings_raw__dbt_tmp"
  
    as (
      

select
    booking_id,
    flight_id,
    passenger_id,
    booking_date,
    booking_status,
    price
from  main.raw_bookings
    );
  
  