

select distinct
        row_number() over( order by b.annee,b.code_region,b.poste_budgetaire) as budget_id,
        a.date_id,
        r.region_id,
        b.poste_budgetaire,
        b.budget_alloue_mad,
        b.budget_execute_mad,
        b.taux_execution

from "education_db"."silver"."stg_budget" b
LEFT JOIN "education_db"."gold"."dim_date" a
    ON b.annee::TEXT = a.annee_debut::TEXT

LEFT JOIN "education_db"."gold"."dim_region" r
    ON b.code_region = r.code_region