
  
    

  create  table "education_db"."gold"."dim_operateur__dbt_tmp"
  
  
    as
  
  (
    

SELECT
    ROW_NUMBER() OVER() AS operateur_id,
    operateur

FROM (
    SELECT DISTINCT
        TRIM(operateur) AS operateur
    FROM "education_db"."silver"."stg_alphabetisation"
    WHERE operateur IS NOT NULL
) t
  );
  