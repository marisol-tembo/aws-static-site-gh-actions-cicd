output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "cloudfront_url" {
  description = "HTTPS URL for the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}
