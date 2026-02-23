WITH cte AS (

SELECT TIME,
        DATE("TIME") AS date,
        HOUR("TIME") As HOUR,
 {{getweek("Time")}} Businesstype,
        Month("TIME") as MONTH,
        {{getseason("TIME")}}  as season
    FROM {{ source('demo', 'weather') }}
)
SELECT *
FROM cte