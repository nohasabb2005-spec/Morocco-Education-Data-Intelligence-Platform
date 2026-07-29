
  
    

  create  table "education_db"."gold"."fact_abandons__dbt_tmp"
  
  
    as
  
  (
    

SELECT DISTINCT

    a.id_abandon AS abandon_id,

    d.date_id,

    p.province_id,

    c.cycle_id,

    g.genre_id,

    a.niveau_classe,

    a.motif_principal,

    a.milieu,

    a.age_abandon,

    a.distance_min,

    a.distance_max,

    a.revenu_mensuel_min,

    a.revenu_mensuel_max,

    a.nb_enfants_menage,

    a.parent_analphabete,

    a.retour_ecole

FROM "education_db"."silver"."stg_abandons" a

LEFT JOIN "education_db"."gold"."dim_date" d
    ON a.annee_scolaire = d.annee_scolaire

LEFT JOIN "education_db"."gold"."dim_province" p
    ON a.province = p.province
   AND a.code_region = p.code_region

LEFT JOIN "education_db"."gold"."dim_cycle" c
    ON a.cycle = c.cycle

LEFT JOIN "education_db"."gold"."dim_genre" g
    ON a.code_genre = g.code_genre
  );
  