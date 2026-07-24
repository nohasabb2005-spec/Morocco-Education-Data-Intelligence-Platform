

WITH mode_filiere AS (

    SELECT filiere
    FROM bronze.examens_nationaux
    WHERE filiere IS NOT NULL
    GROUP BY filiere
    ORDER BY COUNT(*) DESC
    LIMIT 1

)


select 
     trim(id_candidat) as id_candidat,
     annee,
     trim(type_examen) as type_examen,
     COALESCE(e.filiere, m.filiere) AS filiere,
     trim(region) as region,
     trim(code_region) as code_region,
     trim(milieu) as milieu,
     trim(secteur) as secteur,
     trim(genre) as genre,
     note_arabe,
     note_mathematiques,
     note_francais,
     note_sciences,
     note_histoire_geo,
     note_education_islamique,
     moyenne_generale,
    CASE
        WHEN admis = 1 THEN TRUE
        WHEN admis = 0 THEN FALSE
        ELSE NULL
    END AS admis,
    trim(mention) as mention

from bronze.examens_nationaux e
CROSS JOIN mode_filiere m