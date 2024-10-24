{{ config(materialized='view') }}

select
    flight_id,
    flight_number,
    origin_airport_code as airport_from,
    destination_airport_code as airport_to,
    scheduled_departure_time,
    scheduled_arrival_time,
    actual_departure_time,
    actual_arrival_time,
    aircraft_id,
    upper(status) as status
from {{ ref('flights_raw') }}
where status is not null