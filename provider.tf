# AWS provider version definition
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-tfstate-131857913901"
    key            = "global/PROD/terraform.tfstate"
    dynamodb_table = "terraform-tfstate-131857913901"
    region         = "us-east-1"
    profile        = "atentus"
    encrypt        = true
  }
}

#Provider for the network account
provider "aws" {
  region  = var.aws_region
  profile = var.profile
}
