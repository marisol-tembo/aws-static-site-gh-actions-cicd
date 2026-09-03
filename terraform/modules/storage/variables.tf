variable "bucket_name" {
  description = "Globally unique S3 bucket name for the static website assets"
  type        = string
}

variable "force_destroy" {
  description = "Whether Terraform can delete the bucket even when website files exist"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to storage resources"
  type        = map(string)
  default     = {}
}
