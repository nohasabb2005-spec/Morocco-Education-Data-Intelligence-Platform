

SELECT DISTINCT

    -- Clé enseignant
    e.id_enseignant,

    -- Foreign Keys
    d.date_id,
    r.region_id,
    g.genre_id,
    c.cycle_id,

    -- Mesures
    e.anciennete_annees,
    e.salaire_mensuel_mad,
    e.heures_semaine,
    e.jours_absence,
    e.formation_continue,

    -- Attributs descriptifs
    e.categorie,
    e.matiere,
    e.milieu,
    e.province

FROM "education_db"."silver"."stg_enseignants" e

-- Dimension date
LEFT JOIN "education_db"."gold"."dim_date" d
    ON e.annee_scolaire = d.annee_scolaire

-- Dimension région
LEFT JOIN "education_db"."gold"."dim_region" r
    ON e.code_region = r.code_region

-- Dimension genre
LEFT JOIN "education_db"."gold"."dim_genre" g
    ON e.genre = g.genre

-- Dimension cycle
LEFT JOIN "education_db"."gold"."dim_cycle" c
    ON e.cycle_enseigne = c.cycle