################################################################################
# Scope Definition Module Variables
################################################################################

variable "nrn" {
  type        = string
  description = "Nullplatform Resource Name (organization:account format)"
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

variable "scope_slug" {
  type        = string
  description = "The slug of the scope definition"  
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
  
}