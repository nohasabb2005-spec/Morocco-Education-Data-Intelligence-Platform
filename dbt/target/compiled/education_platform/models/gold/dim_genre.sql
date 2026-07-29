

with genres as(
    SELECT DISTINCT
            trim(code_genre) as code_genre,
            trim(genre) as genre
            from "education_db"."silver"."stg_eleves"
            where genre is not null 
            and code_genre is not null
)

SELECT
      ROW_NUMBER() over( ORDER BY code_genre) as genre_id,
      code_genre,
      genre
from genres 
order by code_genre