terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = var.shared_credentials_files
  profile                  = var.aws_profile
}
