
resource "azurerm_windows_web_app" "app" {
  for_each = var.app_services

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  service_plan_id     = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.value.resource_group}/providers/Microsoft.Web/serverfarms/${each.value.app_service_plan}"

  site_config {}

  tags = var.tags

  dynamic "ip_restriction" {
    for_each = [
      {
        name       = "allow-ip"
        priority   = 100
        ip_address = var.allowed_ip
        action     = "Allow"
      },
      {
        name        = "allow-tm"
        priority    = 200
        service_tag = "AzureTrafficManager"
        action      = "Allow"
      }
    ]

    content {
      name        = ip_restriction.value.name
      priority    = ip_restriction.value.priority
      ip_address  = lookup(ip_restriction.value, "ip_address", null)
      service_tag = lookup(ip_restriction.value, "service_tag", null)
      action      = ip_restriction.value.action
    }
  }

  ip_restriction_default_action = "Deny"
}

data "azurerm_client_config" "current" {}
