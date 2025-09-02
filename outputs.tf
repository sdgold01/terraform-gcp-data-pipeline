output "bucket_name" {
  value = google_storage_bucket.data_bucket.name
}

output "dataset_id" {
  value = google_bigquery_dataset.analytics_dataset.dataset_id
}

output "service_account_email" {
  value = google_service_account.data_pipeline_sa.email
}
