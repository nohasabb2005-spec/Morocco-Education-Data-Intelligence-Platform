

WITH provinces AS (

    SELECT DISTINCT
        TRIM(code_region) AS code_region,
        TRIM(province) AS province
    FROM "education_db"."silver"."stg_etablissements"
    WHERE province IS NOT NULL
      AND code_region IS NOT NULL

)

SELECT

    ROW_NUMBER() OVER (ORDER BY p.code_region, p.province) AS province_id,

    r.region_id,

    p.code_region,

    p.province

FROM provinces p

LEFT JOIN "education_db"."gold"."dim_region" r
    ON p.code_region = r.code_region

ORDER BY p.code_region, p.province