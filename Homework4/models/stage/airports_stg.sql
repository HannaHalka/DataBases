{{ config(materialized='view') }}

select
    UPPER(airport_code) as airport_code,
    airport_name,
    city,
    country,
    timezone
from {{ ref('airports_raw') }}