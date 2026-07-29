
  
    

  create  table "education_db"."gold"."dim_etablissement__dbt_tmp"
  
  
    as
  
  (
    

SELECT DISTINCT

    ROW_NUMBER() OVER (ORDER BY e.id_etablissement) AS etablissement_id,

    p.province_id,

    TRIM(e.id_etablissement) AS code_etablissement,

    TRIM(e.nom_etablissement) AS nom_etablissement,

    TRIM(e.milieu) AS milieu,

    TRIM(e.secteur) AS secteur,

    e.annee_creation,

    e.latitude,

    e.longitude

FROM "education_db"."silver"."stg_etablissements" e

LEFT JOIN "education_db"."gold"."dim_province" p
    ON TRIM(e.province) = TRIM(p.province)
  );
  