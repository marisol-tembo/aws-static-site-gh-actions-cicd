output "bucket_id" {
  description = "ID of the website S3 bucket"
  value       = aws_s3_bucket.website.id
}

output "bucket_name" {
  description = "Name of the website S3 bucket"
  value       = aws_s3_bucket.website.bucket
}

output "bucket_arn" {
  description = "ARN of the website S3 bucket"
  value       = aws_s3_bucket.website.arn
}

output "bucket_regional_domain_name" {
  description = "Regional domain name for the website S3 bucket"
  value       = aws_s3_bucket.website.bucket_regional_domain_name
}
