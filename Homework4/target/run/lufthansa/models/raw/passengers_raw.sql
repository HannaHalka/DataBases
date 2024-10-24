
  
    
    

    create  table
      "lh"."main_raw"."passengers_raw__dbt_tmp"
  
    as (
      

select
    passenger_id,
    first_name,
    last_name,
    date_of_birth,
    email,
    phone_number
from  main.raw_passengers
    );
  
  