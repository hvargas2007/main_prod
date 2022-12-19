# Create a NETWORKING Produccion
module "vpc" {
  source            = "../../modules/vpc"
  aws_region        = var.aws_region
  logs_retention    = var.logs_retention
  vpc_cidr          = var.vpc_cidr
  PublicSubnet      = var.PublicSubnet
  PrivateSubnet = var.PrivateSubnet
  name_prefix   = var.name_prefix
  project-tags      = var.project-tags
}
