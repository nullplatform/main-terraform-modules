################################################################################
# Step 1: Fetch Templates
################################################################################

# Fetch service specification template
data "http" "service_spec_template" {
  url = "${var.github_repo_url}/raw/${var.github_ref}/${var.github_scope_path}/specs/service-spec.json.tpl"
}

# Fetch scope configuration template (optional - may not exist for all scopes)
data "http" "scope_configuration_template" {
  count = var.fetch_scope_configuration ? 1 : 0
  url   = "${var.github_repo_url}/raw/${var.github_ref}/${var.github_scope_path}/specs/scope-configuration.json.tpl"
}

# Fetch action specification templates
data "http" "action_templates" {
  for_each = toset(var.action_spec_names)
  url      = "${var.github_repo_url}/raw/${var.github_ref}/${var.github_scope_path}/specs/actions/${each.key}.json.tpl"
}

################################################################################
# Step 2: Process and Create Service Specification
################################################################################

locals {
  # Process the template by replacing the template variables
  # replace is done because some old templates contain gomplate placeholders
  service_spec_rendered = replace(
    data.http.service_spec_template.response_body,
    "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
    "\"${var.nrn}\""
  )
  service_spec_parsed = jsondecode(local.service_spec_rendered)
}

# Create service specification
resource "nullplatform_service_specification" "from_template" {
  name                = local.service_spec_parsed.name
  visible_to          = [var.nrn]
  type                = local.service_spec_parsed.type
  attributes          = jsonencode(local.service_spec_parsed.attributes)
  use_default_actions = local.service_spec_parsed.use_default_actions

  selectors {
    category     = local.service_spec_parsed.selectors.category
    imported     = local.service_spec_parsed.selectors.imported
    provider     = local.service_spec_parsed.selectors.provider
    sub_category = local.service_spec_parsed.selectors.sub_category
  }
}

locals {
  # Variables that depend on created service specification
  service_specification_id = nullplatform_service_specification.from_template.id
  service_slug             = nullplatform_service_specification.from_template.slug

  dependent_env_vars = {
    NRN                      = var.nrn
    SERVICE_SPECIFICATION_ID = local.service_specification_id
    SERVICE_SLUG             = local.service_slug
  }
}

################################################################################
# Step 2.5: Process Scope Configuration (optional)
################################################################################

locals {
  # Replace the NRN gomplate placeholder with the organization_nrn variable
  scope_configuration_rendered = var.fetch_scope_configuration ? replace(
    data.http.scope_configuration_template[0].response_body,
    "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
    "\"${var.organization_nrn}\""
  ) : "{}"
  scope_configuration = var.fetch_scope_configuration ? jsondecode(local.scope_configuration_rendered) : null
}

resource "nullplatform_provider_specification" "from_scope_configuration" {
  count = var.fetch_scope_configuration ? 1 : 0

  name = local.scope_configuration.name
  description = local.scope_configuration.description
  category = local.scope_configuration.category
  allow_dimensions = local.scope_configuration.allow_dimensions
  nrn        = var.organization_nrn
  type       = local.scope_configuration.type
  spec_schema = jsonencode(local.scope_configuration.schema)
}

################################################################################
# Step 3: Process and Create Scope Type
################################################################################



# Create scope type
resource "nullplatform_scope_type" "from_template" {
  depends_on = [nullplatform_service_specification.from_template]

  nrn         = var.nrn
  name        = var.scope_name
  description = var.scope_description
  provider_id = local.service_specification_id
}

################################################################################
# Step 4: Create Action Specifications
################################################################################

# Process action templates - direct JSON parsing (they don't contain template variables)
# replace is done because some old templates contain gomplate placeholders
locals {
  action_specs_parsed = {
    for name in var.action_spec_names :
    name => jsondecode(replace(
      data.http.action_templates[name].response_body,
      "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
      "\"\""
    ))
  }
}

# Create action specifications
resource "nullplatform_action_specification" "from_templates" {
  for_each   = toset(var.action_spec_names)
  depends_on = [nullplatform_service_specification.from_template]

  service_specification_id = local.service_specification_id
  name                     = local.action_specs_parsed[each.key].name
  type                     = local.action_specs_parsed[each.key].type
  parameters               = jsonencode(local.action_specs_parsed[each.key].parameters)
  results                  = jsonencode(local.action_specs_parsed[each.key].results)
  retryable                = try(local.action_specs_parsed[each.key].retryable, false)
}
