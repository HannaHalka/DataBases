

WITH delays AS (
    SELECT
        flight_id,
        scheduled_departure_time,
        actual_departure_time,
        EXTRACT('epoch' FROM (actual_departure_time - scheduled_departure_time)) / 60 AS departure_delay_minutes
      --EXTRACT('epoch' FROM interval) function returns the total number of seconds contained in the interval
    FROM "lh"."main_stage"."flights_stg"
    WHERE actual_departure_time IS NOT NULL
)

SELECT
    AVG(departure_delay_minutes) AS average_delay_minutes,
    MAX(departure_delay_minutes) AS max_delay_minutes,
    MIN(departure_delay_minutes) AS min_delay_minutes,
    COUNT(*) AS total_flights
FROM delays