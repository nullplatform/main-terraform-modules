resource "nullplatform_notification_channel" "github" {
  for_each = var.notify_channels.github.enabled ? toset(var.visible_to) : toset([])
  nrn      = each.key
  type     = "github"
  source   = ["service"]
  filters  = local.filters

  configuration {
    github {
      account         = var.notify_channels.github.account
      reference       = var.notify_channels.github.reference
      repository      = var.notify_channels.github.repository
      workflow_id     = var.notify_channels.github.workflow_id
      installation_id = var.notify_channels.github.installation_id
    }
  }


}

resource "nullplatform_notification_channel" "webhook" {
  for_each = var.notify_channels.webhook.enabled ? toset(var.visible_to) : toset([])
  nrn      = each.key
  type     = "http"
  source   = ["service"]
  filters  = local.filters

  configuration {
    http {
      url     = var.notify_channels.webhook.url
      headers = var.notify_channels.webhook.headers
    }
  }
}
