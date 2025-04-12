/*
De forma geral:
1- Instalar o provider no Terraform
2- Configurar o acesso ao provider (autenticação, nome do projeto, etc.)
3- Criar recursos (dataset do BigQuery, bucket, VM ...)
*/

# aqui eu instalo o provider do google
# baixa e instala os provedores
# terraform init
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
    }
  }
}

# mostra o que será feito antes de alterar a infraestrutura
# terraform plan

# implanta a infraestrutura
# terraform apply

# destrói toda a infra criada do arquivo .tf
# terraform destroy

# 'file' é uma função do terraform que me permite carregar o conteúdo de um arquivo
provider "google" {
  # Configuration options
  # credentials = "./keys/my-cred.json" # essa é apenas uma forma de autenticar, mas é melhor usar variáveis de ambiente
  project     = var.project # project id (dashboard)
  region      = var.region
  credentials = file(var.credential) # autenticar assim ou através de variável de ambiente
}

# criando um recurso (bucket)
resource "google_storage_bucket" "bucket_imdb_dashboard" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true

  # regra do ciclo de vida deste recurso
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

# 'google_bigquery_dataset' é o nome do recurso
# 'demo_dataset' é o nome do pedaço do recurso / "schema"
resource "google_bigquery_dataset" "dw_imdb_dashboard" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}