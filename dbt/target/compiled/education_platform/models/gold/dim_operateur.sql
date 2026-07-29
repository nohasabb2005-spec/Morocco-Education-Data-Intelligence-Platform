

SELECT
    ROW_NUMBER() OVER() AS operateur_id,
    operateur

FROM (
    SELECT DISTINCT
        TRIM(operateur) AS operateur
    FROM "education_db"."silver"."stg_alphabetisation"
    WHERE operateur IS NOT NULL
) t