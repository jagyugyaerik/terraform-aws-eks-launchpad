terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "ap-south-1"
    bucket         = "rbf-central-terraform-state"
    key            = "terraform.tfstate"
    dynamodb_table = "rbf-central-terraform-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
