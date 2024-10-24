

select
    UPPER(airport_code) as airport_code,
    airport_name,
    city,
    country,
    timezone
from "lh"."main_raw"."airports_raw"