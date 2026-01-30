output "bucket_name" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "Região do bucket S3"
  value       = aws_s3_bucket.main.region
}

output "bucket_domain_name" {
  description = "Domain name do bucket S3"
  value       = aws_s3_bucket.main.bucket_domain_name
}
