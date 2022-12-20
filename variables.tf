variable "aws_profile" {
  description = "[REQUERIDO] Profile utilizado para realizar despliegue"
  type        = string
}

variable "aws_region" {
  description = "[REQUERIDO] El AWS Region para implementar los recursos"
  type        = string
}

################
# VARIABLE VPC #
################

#VPC CIDR BLOCK Produccion
variable "vpc_cidr" {
  description = "[REQUERIDO] Bloque de CIDR definido para VPC"
  type        = string
}

variable "logs_retention" {
  description = "[REQUERIDO] La cantidad de días para retener los eventos de registro en CloudWatch 0,1,3,5,7,14,30,60,90,120,150,180,365,400,545,731,1827,3653."
  type        = string
}

variable "name_prefix" {
  description = "[REQUERIDO] Nombre asignado a los recursos de VPC"
  type        = string
}

#CIDR SUBNET PUBLIC and PRIVATE 
variable "PublicSubnet" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
}

variable "PrivateSubnet" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
}


# SSH Key-Pair 
variable "key_name" {
  description = "[REQUIRED] The Key Pair Ec2"
  type        = string
}

/* EC2 Instance type */
#Use: instance_type = var.instance_type["type1"]
variable "instance_type" {
  type = map(string)
  default = {
  }
}

variable "vpc_id" {
  description = "[REQUIRED] The VPC ID"
  type        = string
}

variable "PrivateSubnet_id" {
  description = "[REQUIRED] The Subnet ID"
  type        = string
}


##################
# Tags Variables #
##################
#Use: tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-place-holder" }, )
variable "project-tags" {
  type = map(string)
  default = {
  }
}
