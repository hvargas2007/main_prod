variable "aws_profile" {
  description = "[REQUERIDO] Profile utilizado para realizar despliegue"
  type        = string
  default     = "hermes-ch-cli"
}

variable "aws_region" {
  description = "[REQUERIDO] El AWS Region para implementar los recursos"
  type        = string
  default     = "us-east-1"
}

################
# VARIABLE VPC #
################

#VPC CIDR BLOCK Produccion
variable "vpc_cidr" {
  description = "[REQUERIDO] Bloque de CIDR definido para VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "logs_retention" {
  description = "[REQUERIDO] La cantidad de días para retener los eventos de registro en CloudWatch 0,1,3,5,7,14,30,60,90,120,150,180,365,400,545,731,1827,3653."
  type        = string
  default     = "3"
}

variable "name_prefix" {
  description = "[REQUERIDO] Nombre asignado a los recursos de VPC"
  type        = string
  default     = "Produccion"
}

#CIDR SUBNET PUBLIC and PRIVATE 
variable "PublicSubnet" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
  default = [
    {
      name = "PublicSubnet-A"
      az   = "us-east-1a"
      cidr = "10.10.0.0/24"
    },
    {
      name = "PublicSubnet-B"
      az   = "us-east-1b"
      cidr = "10.10.1.0/24"
    }
  ]
}

variable "PrivateSubnet" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
  default = [
    {
      name = "PrivateSubnet-A"
      az   = "us-east-1a"
      cidr = "10.10.2.0/24"
    },
    {
      name = "PrivateSubnet-B"
      az   = "us-east-1b"
      cidr = "10.10.3.0/24"
    }
  ]
}


##################
# Tags Variables #
##################
#Use: tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-place-holder" }, )
variable "project-tags" {
  type = map(string)
  default = {
    DeployBy   = "CloudHesive",
    Enviroment = "Produccion"
  }
}
