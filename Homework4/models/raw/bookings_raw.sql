{{ config(materialized='table') }}

select
    booking_id,
    flight_id,
    passenger_id,
    booking_date,
    booking_status,
    price
from  main.raw_bookings 