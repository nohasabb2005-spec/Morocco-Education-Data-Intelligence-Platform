

SELECT DISTINCT

    -- Clé bénéficiaire
    a.id_beneficiaire,

    -- Foreign Keys
    d.date_id,
    r.region_id,
    p.province_id,
    g.genre_id,
    o.operateur_id,

    -- Mesures
    a.age,
    a.heures_formation,
    a.formation_completee,
    a.score_evaluation_final

FROM "education_db"."silver"."stg_alphabetisation" a


-- Dimension date
LEFT JOIN "education_db"."gold"."dim_date" d
    ON a.annee::text = d.annee_scolaire


-- Dimension région
LEFT JOIN "education_db"."gold"."dim_region" r
    ON a.code_region = r.code_region


-- Dimension province
LEFT JOIN "education_db"."gold"."dim_province" p
    ON a.province = p.province


-- Dimension genre
LEFT JOIN "education_db"."gold"."dim_genre" g
    ON a.genre = g.genre


-- Dimension opérateur
LEFT JOIN "education_db"."gold"."dim_operateur" o
    ON a.operateur = o.operateur