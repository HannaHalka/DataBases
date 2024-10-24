
  
    
    

    create  table
      "lh"."main_raw"."aircrafts_raw__dbt_tmp"
  
    as (
      

select
    aircraft_id,
    aircraft_model,
    capacity,
    manufacturer,
    in_service_date
from main.raw_aircrafts   -- airlines_lufthansa.raw_aircrafts
    );
  
  