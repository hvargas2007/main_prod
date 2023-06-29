aws_profile    = "hermes-ch-cli"
aws_region     = "us-east-1"
vpc_cidr       = "10.10.0.0/16"
logs_retention = "3"
name_prefix    = "demo"
PublicSubnet = [
  {
    name = "Public-a"
    az   = "us-east-1a"
    cidr = "10.10.0.0/23"
  },
  {
    name = "Public-b"
    az   = "us-east-1b"
    cidr = "10.10.2.0/23"
  }
]
PrivateSubnet = [
  {
    name = "Private-a"
    az   = "us-east-1b"
    cidr = "10.10.4.0/23"
  },
  {
    name = "Private-b"
    az   = "us-east-1b"
    cidr = "10.10.6.0/23"
  }
]

# Variable Tag
project-tags = {
  DeployBy   = "CloudHesive",
  Enviroment = "Dev"
}