
################################################################################
# Step 1: Fetch Templates
################################################################################

locals {
 git_login = var.git_user != null && var.git_password !=null ? "${var.git_user}:${var.git_password}@" : var.git_user != null ? "${var.git_user}@" : ""
 full_git_repo_url = var.git_provider == "github" ? "https://${local.git_login}raw.githubusercontent.com/${var.git_repo}/refs/heads/${var.git_ref}" : null
}

# Fetch service specification template
data "http" "service_spec_template" {
  url = "${local.full_git_repo_url}/${var.git_service_path}/specs/service-spec.json${var.use_tpl_files ? ".tpl" : ""}"
}
# Fetch action specification templates
data "http" "action_templates" {
  for_each = toset(local.available_actions)
  url      = "${local.full_git_repo_url}/${var.git_service_path}/specs/actions/${each.key}.json${var.use_tpl_files ? ".tpl" : ""}"
}

data "http" "link_templates" {
  for_each = toset(local.available_links)
  url      = "${local.full_git_repo_url}/${var.git_service_path}/specs/links/${each.key}.json${var.use_tpl_files ? ".tpl" : ""}"
}


################################################################################
# Step 2: Process and Create Service Specification
################################################################################

locals {
    # Process the template by replacing the template variables
    # replace is done because some old templates contain gomplate placeholders
    service_spec_rendered = var.use_tpl_files ? replace(
        data.http.service_spec_template.response_body,
        "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
        "\"${var.nrn}\""
    ) : data.http.service_spec_template.response_body
    service_spec_parsed = jsondecode(local.service_spec_rendered)
    available_actions = try(local.service_spec_parsed.available_actions, [])
    available_links = try(local.service_spec_parsed.available_links, [])
    visible_to_nrns = concat([var.nrn], var.extra_visibile_to_nrns)
  
}

# Create service specification
resource "nullplatform_service_specification" "from_template" {
  name                = var.service_name
  visible_to          = local.visible_to_nrns
  type               = local.service_spec_parsed.type
  attributes         = jsonencode(local.service_spec_parsed.attributes)
  use_default_actions = local.service_spec_parsed.use_default_actions

  selectors {
    category     = local.service_spec_parsed.selectors.category
    imported     = local.service_spec_parsed.selectors.imported
    provider     = local.service_spec_parsed.selectors.provider
    sub_category = local.service_spec_parsed.selectors.sub_category
  }
  dimensions = jsonencode(var.dimensions)
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
# Process action templates - conditional processing based on file type
# replace is done because some old templates contain gomplate placeholders
locals {
  action_specs_parsed = {
    for name in local.available_actions :
    name => jsondecode(var.use_tpl_files ? replace(
        data.http.action_templates[name].response_body,
        "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
        "\"\""
    ) : data.http.action_templates[name].response_body)
  }
}

# Create action specifications
resource "nullplatform_action_specification" "from_templates" {
  for_each   = toset(local.available_actions )
  depends_on = [nullplatform_service_specification.from_template]

  service_specification_id = local.service_specification_id
  name                     = local.action_specs_parsed[each.key].name
  type                     = local.action_specs_parsed[each.key].type
  parameters               = jsonencode(local.action_specs_parsed[each.key].parameters)
  results                  = jsonencode(local.action_specs_parsed[each.key].results)
  retryable                = try(local.action_specs_parsed[each.key].retryable, false)
}


locals {
  link_specs_parsed = {
    for name in local.available_links :
    name => jsondecode(var.use_tpl_files ? replace(
        data.http.link_templates[name].response_body,
        "/\"{{\\s+env.Getenv\\s+\".*\"\\s+}}\"/",
        "\"\""
    ) : data.http.link_templates[name].response_body)
  }
}

resource "nullplatform_link_specification" "service_link_from_templates" {
  for_each   = toset(local.available_links )
  depends_on = [nullplatform_service_specification.from_template]
 
  name                     = local.link_specs_parsed[each.key].name
  unique                   = try(local.link_specs_parsed[each.key].unique, false)
  specification_id         = local.service_specification_id
  attributes               = jsonencode(local.link_specs_parsed[each.key].attributes)
  use_default_actions      = try(local.link_specs_parsed[each.key].use_default_actions, true)
  selectors {
    category     = local.service_spec_parsed.selectors.category
    imported     = local.service_spec_parsed.selectors.imported
    provider     = local.service_spec_parsed.selectors.provider
    sub_category = local.service_spec_parsed.selectors.sub_category
  }
}