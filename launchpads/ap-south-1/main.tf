provider "aws" {
  region = var.region
}

module "launchpad" {
  source = "../.."

  terraform_backend_config_file_path = var.terraform_backend_config_file_path
  terraform_backend_config_file_name = var.terraform_backend_config_file_name
  force_destroy                      = var.force_destroy

  context = module.this.context
}
