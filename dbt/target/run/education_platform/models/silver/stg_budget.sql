
  
    

  create  table "education_db"."silver"."stg_budget__dbt_tmp"
  
  
    as
  
  (
    

SELECT

    ROW_NUMBER() OVER (ORDER BY annee, region, poste_budgetaire) AS id_budget,

    annee,
    TRIM(region) AS region,
    TRIM(code_region) AS code_region,
    TRIM(poste_budgetaire) AS poste_budgetaire,

    budget_alloue_mad,
    budget_execute_mad,
    taux_execution

FROM bronze.budget
  );
  