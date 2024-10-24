{{ config(materialized='table') }}

with flight_bookings as (
    select
        b.flight_id,
        count(*) AS booked_seats
    from {{ ref('bookings_stg') }} b
    group by b.flight_id
),
flight_capacity as (
    select
        f.flight_id,
        f.aircraft_id,
        a.capacity
    from {{ ref('flights_stg') }} f
    INNER JOIN {{ ref('aircrafts_stg') }} a ON f.aircraft_id = a.aircraft_id
)
select
    fc.flight_id,
    fc.aircraft_id,
    fc.capacity,
    fb.booked_seats,
    (fb.booked_seats::float / fc.capacity) * 100 AS effectiveness_percentage -- typecast to float
from flight_capacity fc
LEFT JOIN flight_bookings fb ON fc.flight_id = fb.flight_id