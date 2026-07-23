from minio import Minio
from dotenv import load_dotenv
import os 
load_dotenv()

client=Minio(
    os.getenv("MINIO_ENDPOINT"),
    access_key=os.getenv("MINIO_ROOT_USER"),
    secret_key=os.getenv("MINIO_ROOT_PASSWORD"),
    secure=False
)

bucket=os.getenv("MINIO_BUCKET")
#Veification du bucket 
if not client.bucket_exists(bucket):
    client.make_bucket(bucket)

folder = "data/bronze"

for file in os.listdir(folder):

    if file.endswith(".csv"):

        client.fput_object(
            bucket,
            file,
            os.path.join(folder, file)
        )

        print(f"{file} envoyé avec succès.")