# AWS provider version definition
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#Provider for the network account
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
