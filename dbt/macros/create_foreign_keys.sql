{% macro create_foreign_keys() %}

ALTER TABLE {{ ref('fact_enseignants') }}
ADD CONSTRAINT fk_enseignants_region
FOREIGN KEY (region_id)
REFERENCES {{ ref('dim_region') }}(region_id);

ALTER TABLE {{ ref('fact_enseignants') }}
ADD CONSTRAINT fk_enseignants_genre
FOREIGN KEY (genre_id)
REFERENCES {{ ref('dim_genre') }}(genre_id);

ALTER TABLE {{ ref('fact_enseignants') }}
ADD CONSTRAINT fk_enseignants_cycle
FOREIGN KEY (cycle_id)
REFERENCES {{ ref('dim_cycle') }}(cycle_id);

ALTER TABLE {{ ref('fact_enseignants') }}
ADD CONSTRAINT fk_enseignants_date
FOREIGN KEY (date_id)
REFERENCES {{ ref('dim_date') }}(date_id);

{% endmacro %}