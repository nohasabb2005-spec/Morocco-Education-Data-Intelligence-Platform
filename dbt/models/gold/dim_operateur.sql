{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER() AS operateur_id,
    operateur

FROM (
    SELECT DISTINCT
        TRIM(operateur) AS operateur
    FROM {{ ref('stg_alphabetisation') }}
    WHERE operateur IS NOT NULL
) t