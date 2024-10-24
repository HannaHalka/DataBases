{{ config(materialized='table') }}

select
    p.passenger_id,
    p.first_name,
    p.last_name,
    sum(b.price) as total_revenue,
    count(*) as total_bookings
from {{ ref('passengers_stg') }} p
INNER JOIN {{ ref('bookings_stg') }} b on p.passenger_id = b.passenger_id
group BY p.passenger_id, p.first_name, p.last_name