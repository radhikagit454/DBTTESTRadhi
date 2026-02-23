{% macro getseason(x) %}
  CASE 
    WHEN MONTH({{ x }}) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH({{ x }}) IN (3, 4, 5)  THEN 'Spring'
    WHEN MONTH({{ x }}) IN (6, 7, 8)  THEN 'Summer'
    ELSE 'Fall'
  END
{% endmacro %}

{% macro getweek(x) %}
       CASE 
  WHEN DAYNAME("TIME") IN ('Sat', 'Sun') THEN 'Weekend' 
  ELSE 'Weekday' 
END
{% endmacro %}