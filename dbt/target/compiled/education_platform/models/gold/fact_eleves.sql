

SELECT distinct 

    e.id_eleve,

    -- Foreign Keys
    d.date_id,
    c.cycle_id,
    g.genre_id,

    -- Mesures
    e.score_moyen,
    e.age,
    e.redoublant,
    e.beneficiaire_bourse,
    e.acces_cantine,
    e.acces_internat,
    e.a_abandonne

FROM "education_db"."silver"."stg_eleves" e


LEFT JOIN "education_db"."gold"."dim_date" d
    ON e.annee_scolaire = d.annee_scolaire


LEFT JOIN "education_db"."gold"."dim_cycle" c
    ON e.cycle = c.cycle


LEFT JOIN "education_db"."gold"."dim_genre" g
    ON e.genre = g.genre