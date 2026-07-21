create schema if not exists Bronze;
--------table1--------
create table if not exists Bronze.eleves(
    id_eleve          varchar(20),
    annee_scolaire    varchar(35),
    region            varchar(35),
    code_region       varchar(15),
    province          varchar(40),
    milieu            varchar(40),
    secteur           varchar(40),
    cycle             varchar(40),
    genre             varchar(40),
    age               integer ,
    redoublant        integer,
    score_moyen       numeric(12,3),
    a_abandonne       integer,
    motif_abandon     varchar(35),
    beneficiaire_bourse integer,
    access_cantine    integer,
    access_internat   integer
),

--------------table2------------
create table if not exists Bronze.enseignants(
    id_enseignant    varchar(40),
    annee_scolaire   varchar(15),
    region           varchar(35),
    code_region      varchar(15),
    province         varchar(35),
    milieu           varchar(35),
    genre            varchar(35),
    cycle_enseigne   varchar(20),
    categorie        varchar(20),
    matiere          varchar(40),
    anciennete_annees integer,
    salaire_mensuel_mad integer,
    heures_semaine   integer,
    formation_continue integer,
    jours_absence    integer
),
-------------table 3----------
create table if not exists Bronze.etablissements(
    id_etablissement    varchar(20),
    nom_etablissement   varchar(35),
    annee_scolaire      varchar(20),
    region              varchar(35),
    code_region         varchar(15),
    province            varchar(20),
    milieu              varchar(35),
    secteur             varchar(35),
    cycle               varchar(35),
    nb_classes          integer,
    effectif_eleves     integer,
    annee_creation      integer,
    equipement_bibliotheque integer,
    equipement_laboratoire integer,
    equipement_salle_sport  integer,
    acces_internet       integer,
    cantine             integer,
    latitude            numeric(12,2),
    longitude           numeric(12,2)
),
---------table4---------------
create table if not exists Bronze.examens_nationaux(
    id_candidat        varchar(20),
    annee              integer,
    type_examen        varchar(35),
    filiere            varchar(35),
    region             varchar(35),
    code_region        varchar(35),
    milieu             varchar(35),
    secteur            varchar(35),
    genre              varchar(35),
    note_arabe         numeric(12,2),
    note_mathematiques numeric(12,2),
    note_francais      numeric(12,2),
    note_sciences      numeric(12,2),
    note_histoire_geo  numeric(12,2),
    note_education_islamique  numeric(12,2),
    moyenne_generale   numeric(12,2)
    admis              integer,
    mention            varchar(35)
),
-----------------table5------------
create table if not exists Bronze.budget(
            annee              integer,
            region             varchar(35),
            code_region        varchar(35),
            poste_budgetaire   varchar(35),
            budget_alloue_mad  integer,
            budget_execute_mad integer,
            taux_execution     numeric(12,2)
),

---------------table6----------------
create table if not exists Bronze.abandons_scolaires(
    id_abandon        varchar(20),
    annee_scolaire    varchar(20),
    region            varchar(35),
    code_region       varchar(15),
    province          varchar(35),
    milieu            varchar(35),
    cycle             varchar(35),
    niveau_classe     varchar(35),
    genre             varchar(35),
    age_abandon       integer,
    motif_principal   varchar(35),
    distance_etablissement     varchar(35),
    revenu_menage_mensuel      varchar(35),
    nb_enfants_menage          integer,
    parent_analphabete         integer,
    retour_ecole               integer
),
----------------table7-------------
create table if not exists Bronze.alphabetisation_adultes(
    id_beneficiaire     varchar(20),
    annee               integer,
    region              varchar(20),
    code_region         varchar(15),
    province            varchar(35),
    milieu              varchar(35),
    genre               varchar(35),
    age                 integer,
    tranche_age         varchar(35),
    operateur           varchar(35),
    niveau_formation    varchar(35),
    heures_formation    integer,
    formation_completee integer,
    score_evaluation_final    numeric(12,2)
),
-----------table8---------------
create table if not exists Bronze.appui_social(
    id_beneficiaire         varchar(20),
    annee_scolaire          varchar(20),
    region                  varchar(35),
    code_region             varchar(15),
    milieu                  varchar(20),
    genre                   varchar(20),
    cycle                   varchar(35),
    type_aide               varchar(20),
    montant_aide_mad        integer,
    organisme_financeur     varchar(35)
);
