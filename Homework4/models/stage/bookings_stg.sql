{{ config(materialized='view') }}

select
    booking_id,
    flight_id,
    passenger_id,
    booking_date,
    UPPER(booking_status) as booking_status,
    price
from {{ ref('bookings_raw') }}
where booking_status is not null