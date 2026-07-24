

SELECT
     trim(id_enseignant) as id_enseignant,
     trim(annee_scolaire) as annee_scolaire,
     trim(region) as region,
     trim(code_region) as code_region,
     trim(province) as province,
     trim(milieu) as milieu,
     trim(genre) as genre,
     trim(cycle_enseigne) as cycle_enseigne,
     trim(categorie) as categorie,
     trim(matiere) as matiere,
     anciennete_annees,
     salaire_mensuel_mad,
     heures_semaine,
     CASE
        WHEN formation_continue = 1 THEN TRUE
        WHEN formation_continue = 0 THEN FALSE
        ELSE NULL
     END AS formation_continue,
     jours_absence
from bronze.enseignants