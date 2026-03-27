################################################################################
# Step 1: Read Existing Scope Type
# provider_id on the scope type gives us the service_specification_id
################################################################################

data "nullplatform_scope_type" "existing" {
  id = var.scope_type_id
}

################################################################################
# Step 2: Read Existing Service Specification (via scope type's provider_id)
################################################################################

data "nullplatform_service_specification" "existing" {
  id = data.nullplatform_scope_type.existing.provider_id
}

################################################################################
# Step 3: List All Action Specifications for the Service Specification
################################################################################

data "nullplatform_action_specifications" "existing" {
  service_specification_id = data.nullplatform_service_specification.existing.id
}

################################################################################
# Step 4: Fetch and Parse Spec Template from Git (for full specification object)
################################################################################

data "github_repository_file" "service_spec_template" {
  repository = var.git_repo
  branch     = var.git_ref
  file       = "${var.git_scope_path}/specs/service-spec.json${var.use_tpl_files ? ".tpl" : ""}"
}

locals {
  # replace is done because some old templates contain gomplate placeholders
  service_spec_rendered = var.use_tpl_files ? replace(
    data.github_repository_file.service_spec_template.content,
    "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
    "\"\""
  ) : data.github_repository_file.service_spec_template.content

  service_spec_parsed = jsondecode(local.service_spec_rendered)

  # Build a name -> id map from the listed action specifications
  action_specification_ids = {
    for spec in data.nullplatform_action_specifications.existing.action_specifications :
    spec.name => spec.id
  }
}
