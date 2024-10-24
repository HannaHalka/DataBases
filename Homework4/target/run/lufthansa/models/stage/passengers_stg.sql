
  
  create view "lh"."main_stage"."passengers_stg__dbt_tmp" as (
    

select
    passenger_id,
    first_name,
    last_name,
    date_of_birth,
    LOWER(email) as email,
    phone_number
from "lh"."main_raw"."passengers_raw"
  );
