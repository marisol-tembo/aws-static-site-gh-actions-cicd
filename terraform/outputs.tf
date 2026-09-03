output "website_bucket_name" {
  description = "Name of the S3 website bucket"
  value       = module.storage.bucket_name
}

output "cloudfront_domain_name" {
  description = "CloudFront domain for the portfolio website"
  value       = module.cdn.cloudfront_domain_name
}

output "cloudfront_url" {
  description = "HTTPS URL for the portfolio website"
  value       = module.cdn.cloudfront_url
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.cdn.cloudfront_distribution_id
}