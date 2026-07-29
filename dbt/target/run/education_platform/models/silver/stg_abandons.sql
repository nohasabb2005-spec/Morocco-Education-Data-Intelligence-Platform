
  
    

  create  table "education_db"."silver"."stg_abandons__dbt_tmp"
  
  
    as
  
  (
    

WITH source AS (

    SELECT
        TRIM(id_abandon) AS id_abandon,
        TRIM(annee_scolaire) AS annee_scolaire,
        TRIM(region) AS region,
        TRIM(code_region) AS code_region,
        TRIM(province) AS province,
        TRIM(milieu) AS milieu,
        TRIM(cycle) AS cycle,
        REPLACE(TRIM(niveau_classe), 'Année ', '') AS niveau_classe,
        TRIM(genre) AS genre,
        age_abandon,
        TRIM(motif_principal) AS motif_principal,

        TRIM(distance_etablissement) AS distance_etablissement,
        TRIM(revenu_menage_mensuel) AS revenu_menage_mensuel,

        nb_enfants_menage,
        parent_analphabete,
        retour_ecole

    FROM bronze.abandons_scolaires

)

SELECT

    id_abandon,
    annee_scolaire,
    region,
    code_region,
    province,
    milieu,
    cycle,
    niveau_classe,
    genre,
    age_abandon,
    motif_principal,

    distance_etablissement,
    revenu_menage_mensuel,

    nb_enfants_menage,

    CASE
        WHEN parent_analphabete = 1 THEN TRUE
        WHEN parent_analphabete = 0 THEN FALSE
        ELSE NULL
    END AS parent_analphabete,

    CASE
        WHEN retour_ecole = 1 THEN TRUE
        WHEN retour_ecole = 0 THEN FALSE
        ELSE NULL
    END AS retour_ecole,

    -- Distance minimale
    CASE
        WHEN distance_etablissement = '< 1 km' THEN NULL
        WHEN distance_etablissement IN ('1-5 km','1–5 km') THEN 1
        WHEN distance_etablissement IN ('5-15 km','5–15 km') THEN 5
        WHEN distance_etablissement = '> 15 km' THEN 15
        ELSE NULL
    END AS distance_min,

    -- Distance maximale
    CASE
        WHEN distance_etablissement = '< 1 km' THEN 1
        WHEN distance_etablissement IN ('1-5 km','1–5 km') THEN 5
        WHEN distance_etablissement IN ('5-15 km','5–15 km') THEN 15
        WHEN distance_etablissement = '> 15 km' THEN NULL
        ELSE NULL
    END AS distance_max,

    -- Revenu minimum
    CASE
        WHEN revenu_menage_mensuel = '< 2000 MAD' THEN NULL
        WHEN revenu_menage_mensuel = '2000-4000 MAD' THEN 2000
        WHEN revenu_menage_mensuel = '4000-7000 MAD' THEN 4000
        WHEN revenu_menage_mensuel = '> 7000 MAD' THEN 7000
        ELSE NULL
    END AS revenu_mensuel_min,

    -- Revenu maximum
    CASE
        WHEN revenu_menage_mensuel = '< 2000 MAD' THEN 2000
        WHEN revenu_menage_mensuel = '2000-4000 MAD' THEN 4000
        WHEN revenu_menage_mensuel = '4000-7000 MAD' THEN 7000
        WHEN revenu_menage_mensuel = '> 7000 MAD' THEN NULL
        ELSE NULL
    END AS revenu_mensuel_max ,
    CASE
        WHEN genre = 'Masculin' THEN 'M'
        WHEN genre = 'Féminin' THEN 'F'
        ELSE NULL
    END AS code_genre

FROM source
  );
  