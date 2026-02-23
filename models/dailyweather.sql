with dailyweather as(
    select date(Time) weatherdate,
    temp,pressure,humidity,clouds,weather from {{source('demo','weather')}}
    
),
dailyweatheragg as(
    select weatherdate,weather,
     Round(Avg(temp),2) Avg_temp,
     Round(Avg(pressure),2)Avg_pressure,
     Round(Avg(humidity),2)Avg_humidity,
     Round(Avg(clouds),2) Avg_clouds
 from dailyweather
    group by weatherdate,weather
 qualify Row_number()over(partition by weatherdate order by count(weather)) =1
)
select * from dailyweatheragg