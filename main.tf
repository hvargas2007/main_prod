# Create a vpc
module "vpc" {
  source         = "git::https://github.com/hvargas2007/codepipeline-vpc?ref=v1.0.5"
  count          = var.deploy_this_module ? 1 : 0
  aws_region     = var.aws_region
  logs_retention = var.logs_retention
  vpc_cidr       = var.vpc_cidr
  PublicSubnet   = var.PublicSubnet
  PrivateSubnet  = var.PrivateSubnet
  name_prefix    = var.name_prefix
  project-tags   = var.project-tags
}