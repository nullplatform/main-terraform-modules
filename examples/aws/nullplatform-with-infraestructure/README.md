# Infraestructura Base AWS para Nullplatform

Este repositorio contiene la configuración de Terraform necesaria para desplegar la infraestructura base en AWS que soporta Nullplatform, incluyendo recursos de red, DNS, Kubernetes y configuraciones de la plataforma.

## Descripción

El proyecto despliega y configura automáticamente:

### Infraestructura AWS Base
- **VPC**: Red privada virtual con subredes públicas y privadas
- **Route53**: Zonas DNS públicas y privadas para gestión de dominios
- **EKS**: Cluster de Kubernetes gestionado
- **ALB Controller**: Controlador de Application Load Balancer para ingress
- **ACM**: Gestión de certificados SSL/TLS

### Configuración Nullplatform
- **Providers**: Configuración de proveedores de Nullplatform (AWS, GitHub)
- **Users**: Gestión de usuarios de la plataforma
- **Accounts**: Configuración de cuentas
- **Agent**: Agente de Nullplatform desplegado en EKS
- **Base Chart**: Helm chart base con configuraciones fundamentales
- **Prometheus**: Stack de monitoreo y métricas

## Requisitos Previos

- Terraform ~> v1.12.2
- OpenTofu ~> v1.10.6
- Cuenta de AWS con permisos administrativos
- API Key de Nullplatform
- GitHub Organization configurada

## Módulos Principales

### 1. Foundations (AWS)
```
├── VPC
├── Route53
├── ACM
├── EKS
└── ALB Controller
```

### 2. Nullplatform Configuration
```
├── Providers
├── Users
├── Accounts
├── Agent
├── Base Chart
└── Prometheus
```

## Variables Requeridas

### AWS & Networking
- `account`: Identificador de cuenta
- `organization`: Nombre de la organización
- `vpc`: Configuración de VPC
- `domain_name`: Dominio para Route53
- `eks_cluster_name`: Nombre del cluster EKS
- `certificate_arn`: ARN del certificado ACM

### Nullplatform
- `nrn`: Nullplatform Resource Name
- `api_key`: API Key de Nullplatform
- `environment`: Entorno (dev, staging, prod)
- `nullplatform_users`: Lista de usuarios
- `nullplatform_accounts`: Lista de cuentas
- `tags`: Tags para el agente 
- `environment_tags`: tags para el channel
- `agent_repos_extra`: Repositorios adicionales para el agente

### GitHub
- `github_organization`: Organización de GitHub
- `github_organization_installation_id`: ID de instalación de GitHub App

## Uso

### 1. Clonar el repositorio
```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Configurar variables
Crear un archivo `terraform.tfvars`:
```hcl
account          = "my-account"
organization     = "my-org"
domain_name      = "example.com"
eks_cluster_name = "nullplatform-cluster"
certificate_arn  = "arn:aws:acm:..."
nrn              = "nrn:..."
api_key          = "np_..."
environment      = "production"

github_organization              = "my-github-org"
github_organization_installation_id = "12345678"

# Usuarios y cuentas
nullplatform_users    = {}
nullplatform_accounts = {}
```

### 3. Inicializar Terraform
```bash
terraform init
```

### 4. Revisar el plan
```bash
terraform plan
```

### 5. Aplicar la configuración
```bash
terraform apply
```

## Arquitectura

```
┌─────────────────────────────────────────────────────────┐
│                        AWS Cloud                        │
│                                                         │
│  ┌────────────────────────────────────────────────┐     │
│  │                    VPC                         │     │
│  │                                                │     │
│  │  ┌──────────────┐      ┌──────────────┐        │     │
│  │  │   Public     │      │   Private    │        │     │
│  │  │   Subnets    │      │   Subnets    │        │     │
│  │  └──────┬───────┘      └──────┬───────┘        │     │
│  │         │                     │                │     │
│  │         │        ┌────────────▼─────────┐      │     │
│  │         │        │      EKS Cluster     │      │     │
│  │         │        │                      │      │     |
│  │         │        │  ┌────────────────┐  │      │     │
│  │         │        │  │ ALB Controller │  │      │     │
│  │         │        │  └────────────────┘  │      │     │
│  │         │        │  ┌────────────────┐  │      │     │
│  │         │        │  │ Nullplatform   │  │      │     │
│  │         │        │  │ Agent - Base   │  │      │     │
│  │         │        │  └────────────────┘  │      │     │
│  │         │        │  ┌────────────────┐  │      │     │
│  │         │        │  │ Prometheus     │  │      │     │
│  │         │        │  └────────────────┘  │      │     │
│  │         │        └──────────────────────┘      │     │
│  │         │                                      │     │
│  │  ┌──────▼───────┐                              │     │
│  │  │     ALB      │                              │     │
│  │  └──────────────┘                              │     │
│  └────────────────────────────────────────────────┘     │
│                                                         │
│  ┌────────────────────────────────────────────────┐     │
│  │              Route53 (DNS)                     │     │
│  │  • Public Zone                                 │     │
│  │  • Private Zone                                │     │
│  └────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────┘
```

## Orden de Despliegue

El código está estructurado para respetar las dependencias:

1. **VPC** → Crea la red base
2. **Route53** → Configura DNS (requiere VPC)
3. **ACM** -> Crea y valida el TLS/SSL
3. **EKS** → Despliega cluster Kubernetes (requiere VPC)
4. **ALB Controller** → Instala controlador (requiere EKS)
5. **Nullplatform Config** → Configura providers (requiere Route53)
6. **Nullplatform Resources** → Crea usuarios y cuentas
7. **Nullplatform Agent** → Despliega agente (requiere EKS)
8. **Base Chart** → Instala configuraciones base (requiere EKS)
9. **Prometheus** → Despliega monitoreo (requiere EKS)

## Outputs

Los módulos generan outputs útiles como:
- VPC ID
- Subnet IDs
- EKS Cluster endpoint
- Route53 Zone IDs
- OIDC Provider ARN

## Limpieza

Para destruir toda la infraestructura:
```bash
terraform destroy
```

⚠️ **Advertencia**: Esto eliminará todos los recursos creados. Asegúrate de hacer backups si es necesario.

## Troubleshooting

### Error al crear EKS
- Verificar que las subredes privadas tengan acceso a internet (NAT Gateway)
- Confirmar que los security groups permitan el tráfico necesario

### ALB Controller no despliega
- Verificar que el OIDC provider esté configurado correctamente
- Revisar los logs del pod del controller

### Prometheus no recolecta métricas
- Confirmar que el agente de Nullplatform esté ejecutándose
- Verificar la configuración de ServiceMonitors

## Soporte

Para más información sobre los módulos, visita:
- [Nullplatform Terraform Modules](https://github.com/nullplatform/main-terraform-modules)
- [Documentación de Nullplatform](https://docs.nullplatform.com)

## Licencia

[Especificar licencia del proyecto]