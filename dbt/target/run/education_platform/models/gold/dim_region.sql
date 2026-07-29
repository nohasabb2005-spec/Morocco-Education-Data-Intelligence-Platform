
  
    

  create  table "education_db"."gold"."dim_region__dbt_tmp"
  
  
    as
  
  (
    

WITH regions AS (

    SELECT DISTINCT
        TRIM(code_region) AS code_region,
        TRIM(region) AS region
    FROM "education_db"."silver"."stg_etablissements"
    WHERE region IS NOT NULL
      AND code_region IS NOT NULL

)

SELECT
    ROW_NUMBER() OVER (ORDER BY code_region) AS region_id,
    code_region,
    region
FROM regions
ORDER BY code_region
  );
  