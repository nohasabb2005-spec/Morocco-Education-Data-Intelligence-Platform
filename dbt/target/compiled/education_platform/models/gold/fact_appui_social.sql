

SELECT DISTINCT

    -- Clé bénéficiaire
    a.id_beneficiaire,

    -- Foreign Keys
    d.date_id,
    r.region_id,
    g.genre_id,
    c.cycle_id,

    -- Mesure
    a.montant_aide_mad,

    -- Informations descriptives
    a.type_aide,
    a.organisme_financeur

FROM "education_db"."silver"."stg_appui_social" a


-- Dimension date
LEFT JOIN "education_db"."gold"."dim_date" d
    ON a.annee_scolaire = d.annee_scolaire


-- Dimension région
LEFT JOIN "education_db"."gold"."dim_region" r
    ON a.code_region = r.code_region


-- Dimension genre
LEFT JOIN "education_db"."gold"."dim_genre" g
    ON a.genre = g.genre


-- Dimension cycle
LEFT JOIN "education_db"."gold"."dim_cycle" c
    ON a.cycle = c.cycle