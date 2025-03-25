import requests
import pandas as pd

# URL do arquivo comprimido
#URL = "https://datasets.imdbws.com/title.ratings.tsv.gz"
URL = "https://datasets.imdbws.com/title.basics.tsv.gz"

# Nome do arquivo local
#LOCAL_FILE = "title.ratings.tsv.gz"
LOCAL_FILE = "title.basics.tsv.gz"

def download_file(url, local_filename):
    """Baixa um arquivo da URL e salva localmente."""
    response = requests.get(url, stream=True)
    response.raise_for_status()  # Lança erro se houver problema no download
    
    with open(local_filename, "wb") as file:
        for chunk in response.iter_content(chunk_size=8192):  # Lendo em blocos de 8KB
            file.write(chunk)
    
    print(f"Download concluído: {local_filename}")

# Baixar o arquivo
download_file(URL, LOCAL_FILE)

# strings, no pandas, são do tipo 'object'
df = pd.read_csv(URL, compression="gzip", sep="\t")
print(df.head())
print(df.info())
