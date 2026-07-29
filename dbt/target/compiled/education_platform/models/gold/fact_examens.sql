

SELECT distinct

    ROW_NUMBER() OVER (ORDER BY e.id_candidat) AS examen_id,

    d.date_id,

    r.region_id,

    g.genre_id,

    e.id_candidat,

    e.type_examen,

    e.filiere,

    e.milieu,

    e.secteur,

    e.mention,

    e.note_arabe,

    e.note_mathematiques,

    e.note_francais,

    e.note_sciences,

    e.note_histoire_geo,

    e.note_education_islamique,

    e.moyenne_generale,

    e.admis

FROM "education_db"."silver"."stg_examens" e

LEFT JOIN "education_db"."gold"."dim_date" d
    ON e.annee::TEXT = d.annee_debut::TEXT

LEFT JOIN "education_db"."gold"."dim_region" r
    ON e.code_region = r.code_region

LEFT JOIN "education_db"."gold"."dim_genre" g
    ON e.genre = g.code_genre