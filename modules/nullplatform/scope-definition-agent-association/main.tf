resource "nullplatform_notification_channel" "channel_from_template" {
  nrn    = var.nrn
  type   = "agent"
  source = var.channel_sources
  

  configuration {
    dynamic "agent" {
      for_each = [1]
      content {
        api_key = var.agent_api_key
        command {
          type = var.agent_command.type
          data = {
            cmdline = var.agent_command.data.cmdline
            arguments = jsonencode(try(var.agent_command.data.arguments, []))
            environment = jsonencode(try(var.agent_command.data.environment, {}))
          }
        }
      
        selector = var.agent_tags
      }
    }
  }

  filters = jsonencode({
    "service.specification.slug" = var.scope_slug
  })
}
