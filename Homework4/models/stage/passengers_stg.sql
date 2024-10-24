{{ config(materialized='view') }}

select
    passenger_id,
    first_name,
    last_name,
    date_of_birth,
    LOWER(email) as email,
    phone_number
from {{ ref('passengers_raw') }}