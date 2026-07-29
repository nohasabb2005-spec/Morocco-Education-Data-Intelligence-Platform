{{ config(
    materialized='table'
) }}

SELECT

    TRIM(id_eleve) AS id_eleve,
    TRIM(annee_scolaire) AS annee_scolaire,
    TRIM(region) AS region,
    TRIM(code_region) AS code_region,
    TRIM(province) AS province,
    TRIM(milieu) AS milieu,
    TRIM(secteur) AS secteur,
    TRIM(cycle) AS cycle,
    TRIM(genre) AS genre,
    age,
    score_moyen,

   
    CASE
        WHEN redoublant = 1 THEN TRUE
        WHEN redoublant = 0 THEN FALSE
        ELSE NULL
    END AS redoublant,

    CASE
        WHEN a_abandonne = 1 THEN TRUE
        WHEN a_abandonne = 0 THEN FALSE
        ELSE NULL
    END AS a_abandonne,

    CASE
        WHEN beneficiaire_bourse = 1 THEN TRUE
        WHEN beneficiaire_bourse = 0 THEN FALSE
        ELSE NULL
    END AS beneficiaire_bourse,

    CASE
        WHEN acces_cantine = 1 THEN TRUE
        WHEN acces_cantine = 0 THEN FALSE
        ELSE NULL
    END AS acces_cantine,

    CASE
        WHEN acces_internat = 1 THEN TRUE
        WHEN acces_internat = 0 THEN FALSE
        ELSE NULL
    END AS acces_internat,

    
    -- Motif d'abandon
  
   CASE
       WHEN a_abandonne = 0 THEN 'Aucun abandon'

        WHEN a_abandonne = 1
         AND (motif_abandon IS NULL OR TRIM(motif_abandon) = '')
        THEN 'Non renseigné'

        ELSE TRIM(motif_abandon)
    END AS motif_abandon,
    CASE 
        WHEN genre ='Masculin' then 'M'
        WHEN genre = 'Féminin' then 'F'
        ELSE NULL
    END AS code_genre

FROM bronze.eleves