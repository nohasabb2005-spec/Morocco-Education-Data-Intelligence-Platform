

select 
     trim(id_beneficiaire) as id_beneficiaire,
     trim(annee_scolaire) as annee_scolaire,
     trim(region) as region,
     trim(code_region) as code_region,
     trim(milieu) as milieu,
     trim(genre) as genre,
     trim(cycle) as cycle,
     trim(type_aide) as type_aide,
     montant_aide_mad,
     trim(organisme_financeur) as organisme_financeur
from bronze.appui_social