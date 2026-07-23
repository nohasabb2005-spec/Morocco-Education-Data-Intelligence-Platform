{{ config(
    materialized='table'
) }}

SELECT
      TRIM(id_etablissement) as id_etablissement,
      trim(nom_etablissement) as nom_etablissement,
      trim(annee_scolaire) as annee_scolaire,
      trim(region) as region,
      trim(code_region) as code_region,
      trim(province) as province,
      trim(milieu) as milieu,
      trim(secteur) as secteur,
      trim(cycle) as cycle,
      nb_classes,
      effectif_eleves,
      annee_creation,
      CASE
        WHEN equipement_bibliotheque = 1 THEN TRUE
        WHEN equipement_bibliotheque = 0 THEN FALSE
        ELSE NULL
      END AS equipement_bibliotheque,

      CASE
        WHEN equipement_laboratoire = 1 THEN TRUE
        WHEN equipement_laboratoire = 0 THEN FALSE
        ELSE NULL
      END AS equipement_laboratoire,
      
      CASE
        WHEN equipement_salle_sport = 1 THEN TRUE
        WHEN equipement_salle_sport = 0 THEN FALSE
        ELSE NULL
      END AS equipement_salle_sport,

      CASE
        WHEN acces_internet = 1 THEN TRUE
        WHEN acces_internet = 0 THEN FALSE
        ELSE NULL
      END AS acces_internet,

      CASE
        WHEN cantine = 1 THEN TRUE
        WHEN cantine = 0 THEN FALSE
        ELSE NULL
      END AS cantine,

      latitude,
      longitude
from bronze.etablissements