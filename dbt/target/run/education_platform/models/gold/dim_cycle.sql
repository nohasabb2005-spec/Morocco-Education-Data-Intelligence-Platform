
  
    

  create  table "education_db"."gold"."dim_cycle__dbt_tmp"
  
  
    as
  
  (
    

SELECT
    ROW_NUMBER() OVER (ORDER BY cycle) AS cycle_id,
    cycle
FROM (
    SELECT
        TRIM(cycle) AS cycle
    FROM "education_db"."silver"."stg_eleves"
    WHERE cycle IS NOT NULL
    GROUP BY TRIM(cycle)
) t
  );
  