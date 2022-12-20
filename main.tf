# Create a vpc
module "vpc" {
  source         = "git::https://github.com/hvargas2007/vpc-demo.git?ref=v1.0.0"
  aws_profile    = var.aws_profile
  aws_region     = var.aws_region
  logs_retention = var.logs_retention
  vpc_cidr       = var.vpc_cidr
  PublicSubnet   = var.PublicSubnet
  PrivateSubnet  = var.PrivateSubnet
  name_prefix    = var.name_prefix
  project-tags   = var.project-tags
}

module "ec2" {
  source           = "git::https://github.com/hvargas2007/ec2-demo.git?ref=v1.0.0"
  aws_profile      = var.aws_profile
  aws_region       = var.aws_region
  vpc_id           = module.vpc.vpc_id
  private_subnet_id = module.vpc.PrivateSubnet_id
  key_name         = var.key_name
  name_prefix      = var.name_prefix
  project-tags     = var.project-tags
}
