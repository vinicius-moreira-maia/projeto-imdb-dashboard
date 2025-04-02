# Pipeline de Extração e Carga dos dados do IMDb (Internet Movie Database)

### Arquitetura

![Kestra Pipeline](imgs/pipeline.png)

### Descrição

Este projeto teve como intuito a implementação de uma pipeline de dados que extrai arquivos TSV (Tab Separated Values) do [IMDb Non-Commercial Datasets](https://developer.imdb.com/non-commercial-datasets/), que contém tanto informações gerais sobre filmes e séries, entre outros, como informações sobre as avaliações dos usuários, para disponibilizá-los no BigQuery. 

Tarefas da pipeline:

1. Download dos arquivos em TSV
2. Conversão dos arquivos TSV para o formato Apache Parquet
3. Carga dos arquivos em .parquet para o data lake (Bucket do Google Cloud Storage)
4. Tratamento dos dados via SQL (Bigquery)
5. Carga dos dados em tabelas do BigQuery 

### Ferramentas Utilizadas

### Sobre o Projeto