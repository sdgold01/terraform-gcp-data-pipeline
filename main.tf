provider "google" {
  project = "lloyds-dev-470905"  
  region  = "europe-west2"       
}

# GCS Bucket
resource "google_storage_bucket" "data_bucket" {
  name          = "lloyds-demo-data-bucket-001"  # must be globally unique
  location      = "EU"
  force_destroy = true
}

# BigQuery Dataset
resource "google_bigquery_dataset" "analytics_dataset" {
  dataset_id                  = "lloyds_demo_dataset"
  location                    = "EU"
  delete_contents_on_destroy  = true
}

resource "google_service_account" "data_pipeline_sa" {
  account_id   = "lloyds-data-pipeline-sa"
  display_name = "Service Account for data pipeline"
}

resource "google_storage_bucket_iam_member" "sa_bucket_access" {
  bucket = google_storage_bucket.data_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.data_pipeline_sa.email}"
}