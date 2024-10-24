{{ config(materialized='table') }}

select
    aircraft_id,
    aircraft_model,
    capacity,
    manufacturer,
    in_service_date
from main.raw_aircrafts   -- airlines_lufthansa.raw_aircrafts