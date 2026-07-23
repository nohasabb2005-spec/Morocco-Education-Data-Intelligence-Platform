import os
import logging
from io import BytesIO

import pandas as pd
from dotenv import load_dotenv
from minio import Minio
from sqlalchemy import create_engine


# Configuration des logs


os.makedirs("logs", exist_ok=True)

logging.basicConfig(
    filename="logs/load_from_minio_to_postgres.log",
    filemode="w",
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
)

console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter("%(levelname)s - %(message)s")
console.setFormatter(formatter)
logging.getLogger().addHandler(console)


# Charger les variables d'environnement


load_dotenv()


# Configuration MinIO


MINIO_ENDPOINT = os.getenv("MINIO_ENDPOINT", "localhost:9000")
MINIO_ACCESS_KEY = os.getenv("MINIO_ROOT_USER")
MINIO_SECRET_KEY = os.getenv("MINIO_ROOT_PASSWORD")
MINIO_BUCKET = os.getenv("MINIO_BUCKET", "education-bronze")


# Configuration PostgreSQL


POSTGRES_USER = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_DB = os.getenv("POSTGRES_DB")
POSTGRES_HOST = os.getenv("POSTGRES_HOST", "localhost")
POSTGRES_PORT = os.getenv("POSTGRES_PORT", "5432")

DATABASE_URL = (
    f"postgresql://{POSTGRES_USER}:"
    f"{POSTGRES_PASSWORD}@"
    f"{POSTGRES_HOST}:"
    f"{POSTGRES_PORT}/"
    f"{POSTGRES_DB}"
)

# Connexion MinIO

minio_client = Minio(
    endpoint=MINIO_ENDPOINT,
    access_key=MINIO_ACCESS_KEY,
    secret_key=MINIO_SECRET_KEY,
    secure=False,
)

# Connexion PostgreSQL


engine = create_engine(DATABASE_URL)

# Fichiers à charger


FILES = {
    "ds1_eleves.csv": "eleves",
    "ds3_enseignants.csv": "enseignants",
    "ds2_etablissements.csv": "etablissements",
    "ds4_examens_nationaux.csv": "examens_nationaux",
    "ds5_budget_education.csv": "budget",
    "ds7_abandons_scolaires.csv": "abandons_scolaires",
    "ds8_alphabetisation_adultes.csv": "alphabetisation_adultes",
    "ds9_appui_social.csv": "appui_social",
}

# Chargement d'un CSV

def load_csv_to_postgres(file_name, table_name):

    logging.info("=" * 80)
    logging.info(f"Lecture du fichier : {file_name}")

    try:

        response = minio_client.get_object(
            bucket_name=MINIO_BUCKET,
            object_name=file_name
        )

        df = pd.read_csv(BytesIO(response.read()))

        logging.info(f"Lignes : {len(df)}")
        logging.info(f"Colonnes : {len(df.columns)}")
        logging.info(f"Noms des colonnes : {list(df.columns)}")
        logging.info(f"Types :\n{df.dtypes}")

        logging.info(f"Valeurs nulles :\n{df.isnull().sum()}")

        df.to_sql(
            name=table_name,
            con=engine,
            schema="bronze",
            if_exists="append",
            index=False,
            method="multi",
        )

        logging.info(f"Table bronze.{table_name} chargée avec succès.")

    except Exception:

        logging.exception(f"Erreur pendant le chargement de {table_name}")

    finally:

        try:
            response.close()
            response.release_conn()
        except:
            pass


# Programme principal

def main():

    logging.info("=" * 80)
    logging.info("CHARGEMENT MINIO -> POSTGRESQL")
    logging.info("=" * 80)

    for file_name, table_name in FILES.items():

        load_csv_to_postgres(file_name, table_name)

    logging.info("=" * 80)
    logging.info("FIN DU CHARGEMENT")
    logging.info("=" * 80)


if __name__ == "__main__":
    main()