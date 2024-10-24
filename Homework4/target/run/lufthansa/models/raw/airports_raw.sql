
  
    
    

    create  table
      "lh"."main_raw"."airports_raw__dbt_tmp"
  
    as (
      

select
    airport_code,
    airport_name,
    city,
    country,
    timezone
from main.raw_airports
    );
  
  