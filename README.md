# terraform-aws-eks-launchpad
Terraform module to provision an S3 bucket to store terraform.tfstate file and a DynamoDB table to lock the state file to prevent concurrent modifications and state corruption and codecommit repository and codebuild jobs.
