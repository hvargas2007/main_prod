# Repositorio Main para despliegues de arquitectura

Este repositorio cumple el objetivo de ser el root module para despliegue de arquitectura en repositorio de servicios

En esta estructura trabajaremos con referencia hacia TAG en los repositorios, por lo cual al hacer el llamado a una nueva version siempore debemos verificar la ultima version del TAG

## Probado con:

| Ambiiente         | aplicacion | Version |
| ----------------- | ---------- | ------- |
| WSL2 Ubuntu 20.04 | Terraform  | v1.3.5  |
| WSL2 Ubuntu 20.04 | aws-cli    | v2.7.9 |


## Procedimientos de implementación:

En el archivo main.tf debe hacerse referencia al source del repositorio que vayamos a desplegar y colocoar las variables utilizadas para el despliegue por ejemplo:

```bash
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
```

Cree un archivo variable.tf con un contenido como el siguiente:

```bash
variable "aws_profile" {
  description = "[REQUERIDO] Profile utilizado para realizar despliegue"
  type        = string
  default     = "XXXXXXXX"
}

variable "aws_region" {
  description = "[REQUERIDO] El AWS Region para implementar los recursos"
  type        = string
  default     = "XXXXXXXX"
}

################
# VARIABLE VPC #
################

#VPC CIDR BLOCK Produccion
variable "vpc_cidr" {
  description = "[REQUERIDO] Bloque de CIDR definido para VPC"
  type        = string
  default     = "XXXXXXXXX"
}

variable "logs_retention" {
  description = "[REQUERIDO] La cantidad de días para retener los eventos de registro en CloudWatch 0,1,3,5,7,14,30,60,90,120,150,180,365,400,545,731,1827,3653."
  type        = string
  default     = "X"
}

variable "name_prefix" {
  description = "[REQUERIDO] Nombre asignado a los recursos de VPC"
  type        = string
  default     = "XXXXXXX"
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
      name = "XXXX" Nombre de la Subnet A
      az   = "XXXX" Az de la subnet A
      cidr = "XXXX" CIDR de la subnet A
    },
    {
      name = "XXXX" Nombre de la Subnet B
      az   = "XXXX" Az de la subnet B
      cidr = "XXXX" CIDR de la subnet B
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
      name = "XXXX" Nombre de la Subnet A
      az   = "XXXX" Az de la subnet A
      cidr = "XXXX" CIDR de la subnet A
    },
    {
      name = "XXXX" Nombre de la Subnet B
      az   = "XXXX" Az de la subnet B
      cidr = "XXXX" CIDR de la subnet B
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
    DeployBy   = "XXXXX", Nombre de que realiza el deploy
    Enviroment = "XXXXX" Ambiente
  }
}
```

Clonar el proyecto 

```bash
  git clone https://github.com/hvargas2007/main_prod.git
```

Ir al directorio del proyecto

```bash
  cd main_prod
```

Ubicado en el directorio donde se encuentra en manifiesto de terraform, haga un "aws configure" para iniciar sesión en la cuenta de aws y un "terraform init" para descargar los módulos necesarios e iniciar el backend.

```bash
aws configure
terraform init
```

## Procedimientos de implementación:

Ubicado en el directorio donde se encuentra en manifiesto de terraform, realice los cambios necesarios en el archivo variables.tf y ejecute los manifiestos:

```bash
terraform fmt      = para darle formato a los archivos
terraform validate = validamos que no tengamos alguna inconsistencia en los recursos
terraform apply    = realizamos ya el despliegue de los recursos
terraform destroy  = destruimos todo lo desplegamos en este manisfiesto
```

## Autor:

Hermes Vargas - Hermes.vargas@cloudhesive.com
