


-- TABLE : ELEVES


CREATE TABLE IF NOT EXISTS bronze.eleves (
    id_eleve                VARCHAR(20) PRIMARY KEY,
    annee_scolaire          VARCHAR(20) NOT NULL,
    region                  VARCHAR(100) NOT NULL,
    code_region             VARCHAR(20),
    province                VARCHAR(100),
    milieu                  VARCHAR(20),
    secteur                 VARCHAR(20),
    cycle                   VARCHAR(30),
    genre                   VARCHAR(10),
    age                     INTEGER CHECK (age >= 3),

    redoublant             INTEGER,
    score_moyen             NUMERIC(5,2),

    a_abandonne             INTEGER,
    motif_abandon           VARCHAR(100),

    beneficiaire_bourse     INTEGER,
    acces_cantine          INTEGER,
    acces_internat         INTEGER
);


-- TABLE : ENSEIGNANTS


CREATE TABLE IF NOT EXISTS bronze.enseignants (
    id_enseignant           VARCHAR(20) PRIMARY KEY,
    annee_scolaire          VARCHAR(20) NOT NULL,
    region                  VARCHAR(100),
    code_region             VARCHAR(20),
    province                VARCHAR(100),
    milieu                  VARCHAR(20),

    genre                   VARCHAR(10),

    cycle_enseigne          VARCHAR(30),
    categorie               VARCHAR(50),
    matiere                 VARCHAR(100),

    anciennete_annees       INTEGER,

    salaire_mensuel_mad     NUMERIC(10,2),

    heures_semaine          INTEGER,

    formation_continue      INTEGER,

    jours_absence           INTEGER
);


-- TABLE : ETABLISSEMENTS


CREATE TABLE IF NOT EXISTS bronze.etablissements (
    id_etablissement            VARCHAR(20) PRIMARY KEY,
    nom_etablissement           VARCHAR(150),

    annee_scolaire              VARCHAR(20),

    region                      VARCHAR(100),
    code_region                 VARCHAR(20),
    province                    VARCHAR(100),

    milieu                      VARCHAR(20),
    secteur                     VARCHAR(20),

    cycle                       VARCHAR(30),

    nb_classes                  INTEGER,

    effectif_eleves             INTEGER,

    annee_creation              INTEGER,

    equipement_bibliotheque     INTEGER,
    equipement_laboratoire      INTEGER,
    equipement_salle_sport      INTEGER,

    acces_internet              INTEGER,

    cantine                     INTEGER,

    latitude                    NUMERIC(10,6),
    longitude                   NUMERIC(10,6)
);

-- TABLE : EXAMENS_NATIONAUX


CREATE TABLE IF NOT EXISTS bronze.examens_nationaux (
    id_candidat                VARCHAR(20) PRIMARY KEY,
    annee                      INTEGER NOT NULL,

    type_examen                VARCHAR(50),
    filiere                    VARCHAR(100),

    region                     VARCHAR(100),
    code_region                VARCHAR(20),

    milieu                     VARCHAR(20),
    secteur                    VARCHAR(20),

    genre                      VARCHAR(10),

    note_arabe                 NUMERIC(5,2),
    note_mathematiques         NUMERIC(5,2),
    note_francais              NUMERIC(5,2),
    note_sciences              NUMERIC(5,2),
    note_histoire_geo          NUMERIC(5,2),
    note_education_islamique   NUMERIC(5,2),

    moyenne_generale           NUMERIC(5,2),

    admis                      INTEGER,

    mention                    VARCHAR(30)
);


-- TABLE : BUDGET


CREATE TABLE IF NOT EXISTS bronze.budget (

    id_budget                  SERIAL PRIMARY KEY,

    annee                      INTEGER NOT NULL,

    region                     VARCHAR(100),
    code_region                VARCHAR(20),

    poste_budgetaire           VARCHAR(100),

    budget_alloue_mad          NUMERIC(15,2),

    budget_execute_mad         NUMERIC(15,2),

    taux_execution             NUMERIC(5,2)
);


-- TABLE : ABANDONS_SCOLAIRES


CREATE TABLE IF NOT EXISTS bronze.abandons_scolaires (

    id_abandon                 VARCHAR(20) PRIMARY KEY,

    annee_scolaire             VARCHAR(20),

    region                     VARCHAR(100),
    code_region                VARCHAR(20),
    province                   VARCHAR(100),

    milieu                     VARCHAR(20),

    cycle                      VARCHAR(30),

    niveau_classe              VARCHAR(30),

    genre                      VARCHAR(10),

    age_abandon                INTEGER,

    motif_principal            VARCHAR(100),

    distance_etablissement     VARCHAR(35),

    revenu_menage_mensuel      varchar(35),

    nb_enfants_menage          INTEGER,

    parent_analphabete        INTEGER,

    retour_ecole               INTEGER
);


-- TABLE : ALPHABETISATION_ADULTES


CREATE TABLE IF NOT EXISTS bronze.alphabetisation_adultes (

    id_beneficiaire            VARCHAR(20) PRIMARY KEY,

    annee                      INTEGER,

    region                     VARCHAR(100),
    code_region                VARCHAR(20),
    province                   VARCHAR(100),

    milieu                     VARCHAR(20),

    genre                      VARCHAR(10),

    age                        INTEGER,

    tranche_age                VARCHAR(30),

    operateur                  VARCHAR(100),

    niveau_formation           VARCHAR(100),

    heures_formation           INTEGER,

    formation_completee        INTEGER,

    score_evaluation_final     NUMERIC(5,2)
);


-- TABLE : APPUI_SOCIAL


CREATE TABLE IF NOT EXISTS bronze.appui_social (

    id_beneficiaire            VARCHAR(20) PRIMARY KEY,

    annee_scolaire             VARCHAR(20),

    region                     VARCHAR(100),
    code_region                VARCHAR(20),

    milieu                     VARCHAR(20),

    genre                      VARCHAR(10),

    cycle                      VARCHAR(30),

    type_aide                  VARCHAR(100),

    montant_aide_mad           NUMERIC(12,2),

    organisme_financeur        VARCHAR(100)
);