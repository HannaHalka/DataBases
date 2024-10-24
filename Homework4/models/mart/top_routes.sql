{{ config(materialized='table') }}

SELECT
    airport_from,
    airport_to,
    COUNT(*) AS total_flights
FROM {{ ref('flights_stg') }}
GROUP BY airport_from, airport_to
ORDER BY total_flights DESC
LIMIT 10