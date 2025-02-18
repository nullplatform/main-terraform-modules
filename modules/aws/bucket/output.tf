output "bucket_arn" {
  description = "bucket arn"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_id" {
  description = "bucket id"
  value       = aws_s3_bucket.bucket.id
}
