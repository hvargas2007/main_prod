# AWS provider version definition
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-tfstate-cicd-poc"
    key            = "global/codepipeline/terraform.tfstate"
    dynamodb_table = "terraform-tfstate-cicd-poc"
    region         = "us-east-1"
    encrypt        = true
  }

}

#Provider for the network account
provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = local.deploy_role
    session_name = "codebuild_deploy"
  }
} 
