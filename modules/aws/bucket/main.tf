resource "aws_s3_bucket" "bucket" {
  bucket = var.name

  force_destroy = true
}
