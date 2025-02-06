resource "google_storage_bucket" "bucket" {
  name                        = "${var.name}-${terraform.workspace}"
  location                    = var.region
  force_destroy               = true
  storage_class               = var.storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.max_days_in_bucket
    }
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = var.max_accepted_versions
    }
  }
}
