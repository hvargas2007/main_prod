locals {
  roles = {
    prod   = "arn:aws:iam::${var.aws_accounts["prod"]}:role/terraform-apply-role"
    dev  = "arn:aws:iam::${var.aws_accounts["dev"]}:role/terraform-apply-role"
    qa = "arn:aws:iam::${var.aws_accounts["qa"]}:role/terraform-apply-role"
  }

  deploy_role = local.roles[terraform.workspace]
}