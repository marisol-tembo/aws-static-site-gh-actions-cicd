terraform {
  backend "s3" {
    bucket       = "marisol-terraform-state-12345"
    key          = "aws-static-site-gh-actions-cicd/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}