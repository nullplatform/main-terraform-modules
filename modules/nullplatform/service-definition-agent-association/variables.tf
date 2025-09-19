################################################################################
# Scope Definition Module Variables
################################################################################

variable "nrn" {
  type        = string
  description = "Nullplatform Resource Name (organization:account format)"
  default = null
}

variable "agent_tags" {
  type        = map(string)
  description = "Agent tags"
}

variable "channel_sources" {
  type        = list(string)
  description = "List of sources for the notification channel (e.g., ['monitoring', 'alerts'])"
  default = [ "telemetry", "service" ]
}

variable "channel_type" {
  type        = string
  description = "Type of the notification channel (e.g., 'agent')"
  default     = "agent"
  
}

variable "agent_api_key" {
  type        = string
  description = "API key with permsissions to run commands on agents (usually ops permisions)"
  sensitive   = true 
}

variable "service_slug" {
  type        = string
  description = "The slug of the scope definition"  
  default = null
}
variable "workflow_override_path" {
  type = string
  default = null
  description = "Path to a custom workflow file to override the default one"
  
}
variable "agent_command" {
  type = object({
    type = string
    data = object({
      cmdline     = string
      arguments   = optional(list(string), [])
      environment = optional(map(string), {})
    })
  })
  default = null
  
}

variable "workflow_override_values" {
  type = string
  default = "null"
  description = "Values to override in the workflow file"
  
}

variable "service_specification_id" {
  type        = string
  description = "The ID of the service definition associated with the agent"
  default     = null
  
}

variable "service_definition" {
  type = object({
    nrn = string,
    slug = string,
    workflow_override_path = string,
    workflow_override_values = string,
    service_specification_id = string,
    specification = object({
      agent_command = object({
        type = string
        data = object({
          cmdline     = string
          arguments   = optional(list(string), [])
          environment = optional(map(string), {})
        })
      })  
    })
  })
}

locals {
  merged_config = merge(
    {
      nrn             = var.nrn
      agent_tags      = var.agent_tags
      channel_sources = var.channel_sources
      channel_type    = var.channel_type
      agent_api_key   = var.agent_api_key
      slug      = var.service_slug
      service_specification_id = var.service_specification_id
      agent_command   = var.agent_command
      workflow_override_path = var.workflow_override_path
      workflow_override_values = var.workflow_override_values
    },
    var.service_definition

  )
}