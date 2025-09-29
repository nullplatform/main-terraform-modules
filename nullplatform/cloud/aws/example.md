# Configuración Terraform - Nullplatform Configuration

## Módulo

```hcl
module "nullplatform_configuration" {
  source = "./nullplatform/platform_config"

  domain_name                   = var.domain_name
  environment                   = var.environment
  hosted_private_zone_id        = var.hosted_private_zone_id
  hosted_public_zone_id         = var.hosted_public_zone_id
  nrn                          = var.nrn
  organization                 = var.github_organization
  organization_installation_id = var.github_organization_installation_id
  certificate_arn              = var.certificate_arn
}
```

## Variables

```hcl
# Ejemplo con diferentes valores
domain_name                         = "acme-corp-services.nullapps.io"
environment                         = "production"
hosted_public_zone_id               = "Z1234567890ABCDEFGH"
hosted_private_zone_id              = "Z9876543210ZYXWVUTS"
nrn                                = "organization=2468013579:account=9876543210"
github_organization                 = "acme-corp"
github_organization_installation_id = "12345678"
certificate_arn                     = "arn:aws:acm:us-west-2:123456789012:certificate/a1b2c3d4-e5f6-7890-1234-56789abcdef0"
```

## Parámetros del Módulo

| Variable | Valor Original                                       | Valor de Ejemplo | Descripción |
|----------|------------------------------------------------------|------------------|-------------|
| `domain_name` | `kwik-e-mart-providers-test.nullapps.io`             | `acme-corp-services.nullapps.io` | Nombre de dominio principal |
| `environment` | `""` (vacío)                                         | `production` | Entorno de despliegue |
| `hosted_public_zone_id` | `Z1234567890ABCDEFGH`                                | `Z1234567890ABCDEFGH` | ID de la zona pública de Route53 |
| `hosted_private_zone_id` | `Z9876543210ZYXWVUTS`                                | `Z9876543210ZYXWVUTS` | ID de la zona privada de Route53 |
| `nrn` | `organization=2468013579:account=2468013579`         | `organization=2468013579:account=9876543210` | Identificador de organización y cuenta |
| `github_organization` | `acme-corp`                                          | `acme-corp` | Organización de GitHub |
| `github_organization_installation_id` | `2468013579`                                           | `12345678` | ID de instalación de la GitHub App |
| `certificate_arn` | `arn:aws:acm:us-east-1:2468013579:certificate/...` | `arn:aws:acm:us-west-2:123456789012:certificate/...` | ARN del certificado SSL de AWS ACM |

## Notas de Configuración

### Dominios
- Los dominios siguen el patrón `{organization}-{service}.nullapps.io`
- Se recomienda usar subdominios descriptivos para diferentes entornos

### Zonas de Route53
- **Zona pública**: Para resolución DNS desde internet
- **Zona privada**: Para resolución DNS interna en VPC

### GitHub Integration
- Requiere una GitHub App instalada en la organización
- El `organization_installation_id` se obtiene de la configuración de la GitHub App

### Certificados SSL
- Deben estar en la región correcta según el uso
- Para CloudFront: certificados deben estar en `us-east-1`
- Para ALB regional: certificados pueden estar en cualquier región