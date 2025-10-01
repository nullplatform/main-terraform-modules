#######################################
# Variables de cuenta / organización
#######################################
variable "account" {
  description = "Nombre o alias de la cuenta"
  type        = string
}

variable "organization" {
  description = "Organización de AWS u otro scope"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, staging, prod, etc.)"
  type        = string
  default     = ""
}

#######################################
# VPC
#######################################
variable "vpc" {
  description = "Configuración de la VPC"
  type = object({
    cidr_block      = string
    azs             = list(string)
    private_subnets = list(string)
    public_subnets  = list(string)
  })
}

#######################################
# Route53 / dominios
#######################################
variable "domain_name" {
  description = "Dominio raíz para el entorno"
  type        = string
}

#######################################
# EKS
#######################################
variable "eks_cluster_name" {
  description = "Nombre del cluster EKS"
  type        = string
}

#######################################
# Nullplatform configuration
#######################################
variable "nrn" {
  description = "ID único de nullplatform (organization y account)"
  type        = string
}

variable "github_organization" {
  description = "Organización de GitHub asociada"
  type        = string
}

variable "github_organization_installation_id" {
  description = "Installation ID de la GitHub App"
  type        = string
}

variable "certificate_arn" {
  description = "ARN del certificado SSL/TLS de ACM"
  type        = string
}

variable "api_key" {
  description = "API Key de Nullplatform"
  type        = string
  sensitive   = true
}

#######################################
# Tags
#######################################
variable "tags" {
  description = "Etiquetas adicionales en formato clave:valor"
  type        = string
}

variable "agent_repos_extra" {
  description = "Repositorios adicionales para el agente"
  type        = list(string)
  default     = []
}

variable "environment_tags" {
  description = "Etiquetas específicas del entorno"
  type        = string
}

#######################################
# Prometheus / monitoring
#######################################
# Se aprovechan las variables eks_cluster_name y nrn


variable "nullplatform_users" {
  type = map(object({
    email               = string
    first_name  = string
    last_name = string
  }))
}

variable "nullplatform_accounts" {
  type = map(object({
    name               = string
    repository_prefix  = string
    repository_provider = string
    slug               = string
  }))
}