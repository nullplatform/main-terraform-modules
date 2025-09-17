################################################################################
# Scope Definition Module Variables
################################################################################

variable "nrn" {
  type        = string
  description = "Nullplatform Resource Name (organization:account format)"
}

variable "github_repo_url" {
  type        = string
  default     = "https://github.com/nullplatform/scopes"
  description = "GitHub repository URL containing templates"
}

variable "workflow_override_path" {
  type = string
  default = ""
  description = "Path to a custom workflow file to override the default one"
}

variable "github_ref" {
  type        = string
  default     = "main"
  description = "Git reference (branch, tag, or commit)"
}

variable "github_scope_path" {
  type        = string
  default     = "k8s"
  description = "Path within the repository for the specific scope (e.g., k8s, ecs)" 
}

variable "scope_name" {
  type        = string
  description = "Name of the scope type to be created"
}
variable "scope_description" {
  type        = string
  description = "Description of the scope type to be created"
} 

variable "action_spec_names" {
  type = list(string)
  default = [
    "create-scope",
    "delete-scope",
    "start-initial",
    "start-blue-green",
    "finalize-blue-green",
    "rollback-deployment",
    "delete-deployment",
    "switch-traffic",
    "set-desired-instance-count",
    "pause-autoscaling",
    "resume-autoscaling",
    "restart-pods",
    "kill-instances"
  ]
  description = "List of action specification template names to fetch and create"
}

variable "use_tpl_files" {
  type        = bool
  default     = true
  description = "Whether to use .tpl files (true) or .json files (false) for templates"
}

# NRN Patch Configuration
variable "np_api_key" {
  type        = string
  sensitive   = true
  description = "Nullplatform API key for authentication"
}

