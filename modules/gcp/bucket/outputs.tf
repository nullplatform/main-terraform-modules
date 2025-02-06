output "created_bucket_name" {
  value       = google_storage_bucket.bucket.name
  description = "Name of the bucket created in GCP"
}

output "bucket_versioning_status" {
  value       = google_storage_bucket.bucket.versioning[0].enabled
  description = "Indicates whether versioning is enabled"
}
