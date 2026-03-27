################################################################################
# Scope Definition Import Module Variables
################################################################################

variable "nrn" {
  type        = string
  description = "Nullplatform Resource Name (organization:account format)"
}

variable "scope_type_id" {
  type        = string
  description = "ID of the existing scope type. The service specification and action specifications are derived from it automatically."
}

# Git variables — used to read the spec template and reconstruct the full
# specification object (including agent_command).
variable "git_repo" {
  type        = string
  default     = "nullplatform/scopes"
  description = "GitHub repository containing the scope spec templates"
}

variable "git_ref" {
  type        = string
  default     = "main"
  description = "Git reference (branch, tag, or commit) for the spec templates"
}

variable "git_scope_path" {
  type        = string
  description = "Path within the repository for the specific scope (e.g., k8s, ecs)"
}

variable "use_tpl_files" {
  type        = bool
  default     = true
  description = "Whether to use .tpl files (true) or .json files (false) for templates"
}

variable "git_provider" {
  type        = string
  default     = "github"
  description = "Git provider (e.g., github, gitlab)"
}

variable "git_user" {
  type        = string
  default     = null
  description = "Git username for authentication"
}

variable "git_password" {
  type        = string
  default     = null
  sensitive   = true
  description = "Git password or token for authentication"
}

variable "workflow_override_path" {
  type        = string
  default     = null
  description = "Path to a custom workflow file to override the default one"
}

variable "workflow_override_values" {
  type        = string
  default     = null
  description = "Values to override in the workflow file"
}
