{{ config(
    materialized='table'
) }}

SELECT distinct 

    e.id_eleve,

    -- Foreign Keys
    d.date_id,
    c.cycle_id,
    g.genre_id,

    -- Mesures
    e.score_moyen,
    e.redoublant,
    e.beneficiaire_bourse,
    e.acces_cantine,
    e.acces_internat,
    e.a_abandonne

FROM {{ ref('stg_eleves') }} e


LEFT JOIN {{ ref('dim_date') }} d
    ON e.annee_scolaire = d.annee_scolaire


LEFT JOIN {{ ref('dim_cycle') }} c
    ON e.cycle = c.cycle


LEFT JOIN {{ ref('dim_genre') }} g
    ON e.genre = g.genre