
  
    

  create  table "education_db"."gold"."dim_date__dbt_tmp"
  
  
    as
  
  (
    

WITH dates AS (

    SELECT annee_scolaire::text AS annee_scolaire
    FROM "education_db"."silver"."stg_eleves"

    UNION

    SELECT annee::text AS annee_scolaire
    FROM "education_db"."silver"."stg_examens"

    UNION

    SELECT annee::text AS annee_scolaire
    FROM "education_db"."silver"."stg_budget"

    UNION

    SELECT annee_scolaire::text AS annee_scolaire
    FROM "education_db"."silver"."stg_appui_social"

    UNION

    SELECT annee_scolaire::text AS annee_scolaire
    FROM "education_db"."silver"."stg_abandons"

    UNION

    SELECT annee::text AS annee_scolaire
    FROM "education_db"."silver"."stg_alphabetisation"

)

SELECT

    ROW_NUMBER() OVER (ORDER BY annee_scolaire) AS date_id,

    annee_scolaire,

    CASE
        WHEN annee_scolaire LIKE '%-%'
        THEN SPLIT_PART(annee_scolaire, '-', 1)::INT
        ELSE annee_scolaire::INT
    END AS annee_debut,

    CASE
        WHEN annee_scolaire LIKE '%-%'
        THEN SPLIT_PART(annee_scolaire, '-', 2)::INT
        ELSE annee_scolaire::INT
    END AS annee_fin

FROM (
    SELECT DISTINCT annee_scolaire
    FROM dates
) d

ORDER BY annee_scolaire
  );
  