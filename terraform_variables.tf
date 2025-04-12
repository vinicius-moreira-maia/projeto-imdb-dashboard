variable "credential" {
  description = "Service Account Credentials"
  default     = "/home/vmm/projeto-imdb-dashboard/keys/credentials.json"
}

variable "project" {
  description = "Project"
  default     = "project-imdb-dashboard"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "BigQuery Schema / Data Set"
  default     = "dw_imdb_dashboard"
}

variable "gcs_bucket_name" {
  description = "Bucket / Data Lake"
  default     = "bucket_imdb_dashboard"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDART"
}