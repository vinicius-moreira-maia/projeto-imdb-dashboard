# https://datasets.imdbws.com/

# https://developer.imdb.com/non-commercial-datasets/

import dlt
import pandas as pd

# URL do arquivo comprimido
#URL = "https://datasets.imdbws.com/title.ratings.tsv.gz"
URL = "https://datasets.imdbws.com/title.basics.tsv.gz"

# Criar um pipeline DLT
pipeline = dlt.pipeline(
    pipeline_name="imdb_loader",
    destination="duckdb",  # Pode ser substituído por outro destino (BigQuery, Snowflake, etc.)
    dataset_name="imdb"
)

# Gerador para baixar e ler o arquivo em chunks
def imdb_data():
    for chunk in pd.read_csv(URL, compression="gzip", sep="\t", chunksize=10000, low_memory=False):
        yield chunk.to_dict(orient="records")  # Converte cada chunk para uma lista de dicionários

# Carregar os dados no Data Warehouse
info = pipeline.run(imdb_data(), table_name="title_akas")

print(info)  # Exibir resumo da carga
