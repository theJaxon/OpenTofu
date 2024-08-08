module "vpc" {
  source    = "./modules/vpc"
  infra_env = var.infra_env
  project   = var.project
}