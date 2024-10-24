
  
    
    

    create  table
      "lh"."main_mart"."revenue_from_passengers__dbt_tmp"
  
    as (
      

select
    p.passenger_id,
    p.first_name,
    p.last_name,
    sum(b.price) as total_revenue,
    count(*) as total_bookings
from "lh"."main_stage"."passengers_stg" p
INNER JOIN "lh"."main_stage"."bookings_stg" b on p.passenger_id = b.passenger_id
group BY p.passenger_id, p.first_name, p.last_name
    );
  
  