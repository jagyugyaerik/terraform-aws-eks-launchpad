module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"

  version    = "0.38.1"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = ["state"]

  logging_bucket_enabled = true

  terraform_backend_config_file_path = var.terraform_backend_config_file_path
  terraform_backend_config_file_name = var.terraform_backend_config_file_name
  force_destroy                      = var.force_destroy

  context = module.this.context
}

module "codecommit_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  attributes = ["code"]
  context    = module.this.context
}

resource "aws_codecommit_repository" "this" {
  repository_name = module.codecommit_label.id
  description     = "This is the Infrastructure Repository"
  default_branch  = "main"
  tags            = module.codecommit_label.tags
}