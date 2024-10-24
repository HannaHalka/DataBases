

select
    aircraft_id,
    aircraft_model,
    capacity,
    manufacturer,
    in_service_date
from "lh"."main_raw"."aircrafts_raw"
where in_service_date IS NOT null