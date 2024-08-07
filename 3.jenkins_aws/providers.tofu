provider "aws" {
  region                   = var.region
  shared_credentials_files = var.shared_credentials_files
  profile                  = var.aws_profile
  default_tags {
    tags = {
      Environment = var.infra_env
      Project     = var.project
    }
  }
}
