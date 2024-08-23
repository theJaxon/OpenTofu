provider "aws" {
  region  = var.region
  profile = "theJaxon"
  default_tags {
    tags = {
      Environment = terraform.workspace
    }
  }
}