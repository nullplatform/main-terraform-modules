# Nullplatform sobre Infraestructura AWS Existente

Este repositorio contiene la configuración de Iac para desplegar Nullplatform sobre una infraestructura AWS existente. Asume que ya cuentas con VPC, Route53, EKS y ALB Controller configurados.

## Descripción

El proyecto configura y despliega únicamente los componentes de Nullplatform:

### Configuración de Nullplatform
- **Providers**: Integración con AWS y GitHub
- **Users**: Gestión de usuarios de la plataforma
- **Accounts**: Configuración de cuentas
- **Agent**: Agente de Nullplatform desplegado en el cluster EKS existente
- **Base Chart**: Helm chart base con configuraciones de logs y métricas
- **Prometheus**: Stack de monitoreo y recolección de métricas

## Requisitos Previos

### Infraestructura AWS Existente
- ✅ VPC con subredes públicas y privadas
- ✅ Route53 con zonas DNS públicas y privadas configuradas
- ✅ Cluster EKS funcional y accesible con OIDC habilitado
- ✅ ALB Controller instalado en el cluster
- ✅ Certificado ACM creado y disponible

### Credenciales y Accesos
- Terraform ~> v1.12.2
- OpenTofu ~> v1.10.6
- `kubectl` configurado para acceder al cluster EKS
- API Key de Nullplatform (generada a nivel Organización y con roles Ops, SecOps, SecretReader)
- GitHub Organization con la App instalada (https://docs.nullplatform.com/docs/providers/tutorials/configuring-github#record-your-installation-id)
- Permisos IAM para crear roles y políticas

## Estructura del Proyecto

```
.
├── main.tf              # Configuración principal de módulos
├── variables.tf         # Definición de variables
├── terraform.tfvars     # Valores de variables (no versionar)
├── data.tf             # Data sources para recursos existentes
└── README.md           # Este archivo
```

## Variables Requeridas

### Infraestructura AWS Existente
```hcl
# Cluster EKS
eks_cluster_name = "nombre-del-cluster-existente"

# DNS
domain_name            = "example.com"
hosted_private_zone_id = "Z1234567890ABC"  # ID de la zona privada existente
hosted_public_zone_id  = "Z0987654321XYZ"  # ID de la zona pública existente

# Certificados
certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/..."
```

### Nullplatform
```hcl
# Configuración general
nrn         = "nrn:organization:account:scope:..."
api_key     = "np_..."
environment = "production"  # o "staging", "development"

# GitHub
github_organization              = "mi-organizacion"
github_organization_installation_id = "12345678"

# Usuarios
nullplatform_users = {
  admin = {
    email      = "admin@example.com"
    first_name = "admin"
    last_name  = "admin"
  }
}

# Cuentas
nullplatform_accounts = {
  main = {
    name = "main",
    repository_prefix = "main",
    repository_provider = optional(string, "github")
    slug               = "main"
  }
}
# tags para el agente
tags = "environment:providers-test"

# Tags to channel
environment_tags = "providers-test"

agent_repos_extra = []
```

## Data Sources Necesarios

En el archivo `data.tf` ecnontraras la informacion para referenciar recursos existentes:

```hcl
# Obtener información del cluster EKS existente
data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

## Opcionales
# Obtener información de la VPC
data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["nombre-de-tu-vpc"]  # Ajustar según tu VPC
  }
}

# Obtener zonas DNS (opcional, si no usas variables)
data "aws_route53_zone" "private" {
  zone_id      = var.hosted_private_zone_id
  private_zone = true
}

data "aws_route53_zone" "public" {
  zone_id = var.hosted_public_zone_id
}
```

## Configuración del Provider

En el archivo `providers.tf` encontraras la configuracion para usar los diferentes providers requeridos en la instalacion

```hcl
terraform {
  required_version = "~> 1.0"
  required_providers {
    nullplatform = {
      source  = "nullplatform/nullplatform"
      version = "~> 0.0.63"
    }
  }
  provider "nullplatform" {
    api_key = var.api_key
}
  
  
}

# Provider de Kubernetes y helm  usando el cluster EKS existente
provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "--profile", "providers-test",
      "eks", "get-token",
      "--cluster-name", var.eks_cluster_name
    ]
  }
}

provider "helm" {
  kubernetes = {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "--profile", "providers-test",
        "eks", "get-token",
        "--cluster-name", var.eks_cluster_name
      ]
    }
  }
}
```

## Guía de Uso

### 1. Verificar Prerequisitos

Asegúrate de tener acceso al cluster:
```bash
aws eks update-kubeconfig --name <nombre-cluster> --region <region>
kubectl get nodes
```

Verifica que el ALB Controller esté funcionando:
```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```

### 2. Configurar Variables

Crea un archivo `terraform.tfvars`:
```hcl
# AWS Infrastructure (existente)
eks_cluster_name       = "my-existing-cluster"
domain_name            = "example.com"
hosted_private_zone_id = "Z1234567890ABC"
hosted_public_zone_id  = "Z0987654321XYZ"
certificate_arn        = "arn:aws:acm:..."

# Nullplatform
nrn         = "nrn:..."
api_key     = "np_..."
environment = "production"

# GitHub
github_organization              = "my-org"
github_organization_installation_id = "12345678"

# Users & Accounts
nullplatform_users = {
  admin = {
    email      = "admin@example.com"
    first_name = "admin"
    last_name  = "admin"
  }
}

nullplatform_accounts = {
  main = {
    name = "main",
    repository_prefix = "main",
    repository_provider = optional(string, "github")
    slug               = "main"
  }
}
```

### 3. Inicializar y Desplegar

```bash
# Inicializar Terraform
terraform init

# Revisar el plan
terraform plan

# Aplicar la configuración
terraform apply
```

### 4. Verificar el Despliegue

```bash
# Verificar que el agente esté corriendo
kubectl get pods -n nullplatform-system

# Verificar Prometheus
kubectl get pods -n monitoring

# Verificar los servicios
kubectl get svc --all-namespaces
```

## Componentes Desplegados

### 1. Nullplatform Providers
Configura la integración entre Nullplatform y tus proveedores:
- AWS (usando las zonas DNS y certificados existentes)
- GitHub (como repositorio de las aplicaciones)

### 2. Usuarios y Cuentas
Gestiona el acceso y las cuentas dentro de Nullplatform.

### 3. Nullplatform Agent
Agente desplegado en el cluster EKS que:
- Gestiona deployments
- Sincroniza estado con Nullplatform
- Maneja secrets y configuraciones
- Se comunica con la API de Nullplatform

### 4. Base Chart
Helm chart con configuraciones fundamentales:
- Logs & Metricas

### 5. Prometheus Stack
Stack de monitoreo que incluye:
- Prometheus server
- Service monitors
- Alert managers

## Arquitectura

```
┌─────────────────────────────────────────────────────────┐
│           Infraestructura AWS Existente                 │
│                                                         │
│  ┌────────────────────────────────────────────────┐     │
│  │              VPC (existente)                   │     │
│  │                                                │     │
│  │         ┌──────────────────────────────┐       │     │
│  │         │   Cluster EKS (existente)    │       │     │
│  │         │                              │       │     │
│  │         │  ┌────────────────────────┐  │       │     │
│  │         │  │  Nullplatform Agent    │  │       │     │       
│  │         │  │  • Deployment Manager  │  │       │     │
│  │         │  │  • State Sync          │  │       │     │
│  │         │  └────────────────────────┘  │       │     │
│  │         │                              │       │     │
│  │         │  ┌────────────────────────┐  │       │     │
│  │         │  │  Base Chart            │  │       │     │           
│  │         │  │  • Logs                │  │       │     │
│  │         │  │  • Métricas            │  │       │     │
│  │         │  └────────────────────────┘  │       │     │
│  │         │                              │       │     │
│  │         │  ┌────────────────────────┐  │       │     │
│  │         │  │  Prometheus            │  │       │     │            
│  │         │  │  • Metrics Collection  │  │       │     │
│  │         │  │  • Monitoring          │  │       │     │
│  │         │  └────────────────────────┘  │       │     │
│  │         └──────────────────────────────┘       │     │
│  │                                                │     │
│  │         ALB Controller (existente)             │     │
│  └────────────────────────────────────────────────┘     │
│                                                         │
│  Route53 DNS (existente)                                │
│  ACM Certificate (existente)                            │
└─────────────────────────────────────────────────────────┘
                         │
                         │ API Calls
                         ▼
              ┌──────────────────────┐
              │  Nullplatform API    │
              │  • Configuration     │
              │  • State Management  │
              └──────────────────────┘
```

## Permisos IAM Requeridos

El agente de Nullplatform necesitará permisos IAM. El módulo creará automáticamente:
- IAM Role para el Service Account
- Políticas necesarias para interactuar con AWS
- Binding con el OIDC provider del cluster

Permisos típicos requeridos:
- Route53 (gestión de DNS)
- ECR (pull de imágenes)
- Secrets Manager (gestión de secrets)
- CloudWatch (logs y métricas)

## Troubleshooting

### El agente no inicia
```bash
# Ver logs del agente
kubectl logs -n nullplatform-system -l app=nullplatform-agent

# Verificar el service account
kubectl get serviceaccount -n nullplatform-system

# Verificar el IAM role
kubectl describe serviceaccount -n nullplatform-system nullplatform-agent
```

### Problemas con OIDC Provider
```bash
# Verificar que el OIDC provider existe
aws iam list-open-id-connect-providers

# Verificar la URL del OIDC
aws eks describe-cluster --name <cluster-name> --query "cluster.identity.oidc.issuer"
```

### Prometheus no recolecta métricas
```bash
# Verificar los service monitors
kubectl get servicemonitor -n monitoring

# Ver logs de Prometheus
kubectl logs -n monitoring -l app=prometheus

# Verificar los targets
kubectl port-forward -n monitoring svc/prometheus 9090:9090
# Abrir http://localhost:9090/targets
```

### Problemas de conectividad
```bash
# Verificar network policies
kubectl get networkpolicies --all-namespaces

# Verificar que los pods pueden comunicarse
kubectl run -it --rm debug --image=busybox --restart=Never -- sh
```

## Actualización de Componentes

Para actualizar los charts de Nullplatform:

```bash
# Actualizar un módulo específico
terraform apply -target=module.nullplatform_agent

# Actualizar todos los charts
terraform apply
```

## Limpieza

Para eliminar únicamente los componentes de Nullplatform:

```bash
terraform destroy
```

⚠️ **Nota**: Esto NO eliminará tu infraestructura AWS existente (VPC, EKS, Route53, etc.)

## Migración desde Infraestructura Completa

Si anteriormente desplegabas todo con Terraform, para migrar:

1. Exporta los IDs de recursos existentes
2. Actualiza `terraform.tfvars` con los valores
3. Comenta los módulos de infraestructura en `main.tf`
4. Ejecuta `terraform init` y `terraform plan`

## Monitoreo y Observabilidad

Una vez desplegado, puedes acceder a:

### Prometheus UI
```bash
kubectl port-forward -n monitoring svc/prometheus-server 9090:80
# Abrir http://localhost:9090
```
