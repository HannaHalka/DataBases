

with flights as (
    select
        flight_id,
        -- date(scheduled_departure_time) as flight_date,
        -- Function with name date does not exist! Did you mean "datesub"?
        CAST (scheduled_departure_time AS DATE) AS flight_date,
        airport_from,
        airport_to,
        status
    from "lh"."main_stage"."flights_stg"
)
select
    flight_date,
    airport_from,
    airport_to,
    count(*) as total_flights,
    sum(case when status = 'DEPARTED' then 1 else 0 end) as flights_departed,
    sum(case when status = 'CANCELLED' then 1 else 0 end) as flights_cancelled
from flights
group by flight_date, airport_from, airport_to