locals {
  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

module "storage" {
  source = "./modules/storage"

  bucket_name   = var.website_bucket_name
  force_destroy = var.force_destroy_bucket
  tags          = local.tags
}

module "cdn" {
  source = "./modules/cdn"

  project_name                = var.project_name
  origin_access_control_name  = var.origin_access_control_name
  distribution_comment        = var.distribution_comment
  bucket_id                   = module.storage.bucket_id
  bucket_arn                  = module.storage.bucket_arn
  bucket_regional_domain_name = module.storage.bucket_regional_domain_name
  default_root_object         = "index.html"
  error_response_page_path    = "/error.html"
  tags                        = local.tags
}