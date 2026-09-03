variable "aws_region" {
  description = "AWS region used for the project"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Name used for resource naming and tags"
  type        = string
  default     = "aws-static-site-gh-actions-cicd"
}

variable "website_bucket_name" {
  description = "Globally unique S3 bucket name for the static website assets"
  type        = string
  default     = "marisol-aws-static-site-gh-actions-cicd"
}

variable "origin_access_control_name" {
  description = "Name of the CloudFront Origin Access Control"
  type        = string
  default     = "marisol-portfolio-oac"
}

variable "distribution_comment" {
  description = "Comment shown on the CloudFront distribution"
  type        = string
  default     = "Marisol DevOps portfolio"
}

variable "force_destroy_bucket" {
  description = "Whether Terraform can delete the bucket even when website files exist"
  type        = bool
  default     = true
}