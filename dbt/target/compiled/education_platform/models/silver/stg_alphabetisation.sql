
 
select 
     trim(id_beneficiaire) as id_beneficiaire,
     annee,
     trim(region) as region,
     trim(code_region) as code_region,
     trim(province) as province,
     trim(milieu) as milieu,
     trim(genre) as genre,
     age,
     CASE
        WHEN TRIM(tranche_age) = '' OR tranche_age IS NULL THEN 'Inconnu'
        ELSE TRIM(tranche_age)
     END AS tranche_age,
     trim(operateur) as operateur,
     REPLACE(
       REPLACE(
               REPLACE(
                 REPLACE(
                    REPLACE(niveau_formation,'Niveau 1 ',''),
                   'Niveau 2 ',''
                ),
                'Niveau 3 ',''
               ),
        '(',
        ''
    ),
    ')',
    ''
    ) AS niveau_formation,
    heures_formation,
    CASE 
       when formation_completee = 1 then True 
       when formation_completee = 0 then FALSE
       else NULL
    end as formation_completee,
    score_evaluation_final

from bronze.alphabetisation_adultes