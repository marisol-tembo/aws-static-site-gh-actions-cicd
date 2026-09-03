variable "project_name" {
  description = "Name used for CloudFront resource naming"
  type        = string
}

variable "origin_access_control_name" {
  description = "Name of the CloudFront Origin Access Control"
  type        = string
}

variable "distribution_comment" {
  description = "Comment shown on the CloudFront distribution"
  type        = string
}

variable "bucket_id" {
  description = "ID of the private S3 bucket served by CloudFront"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the private S3 bucket served by CloudFront"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "Regional domain name of the private S3 bucket origin"
  type        = string
}

variable "default_root_object" {
  description = "Default object CloudFront returns for root requests"
  type        = string
  default     = "index.html"
}

variable "error_response_page_path" {
  description = "Path to the custom error page object"
  type        = string
  default     = "/error.html"
}

variable "tags" {
  description = "Tags applied to CDN resources"
  type        = map(string)
  default     = {}
}
