
  
    
    

    create  table
      "lh"."main_mart"."top_routes__dbt_tmp"
  
    as (
      

SELECT
    airport_from,
    airport_to,
    COUNT(*) AS total_flights
FROM "lh"."main_stage"."flights_stg"
GROUP BY airport_from, airport_to
ORDER BY total_flights DESC
LIMIT 10
    );
  
  