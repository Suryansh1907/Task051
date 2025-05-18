
resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.traffic_manager.name
  resource_group_name    = var.traffic_manager.resource_group
  traffic_routing_method = var.traffic_manager.routing_method
  dns_config {
    relative_name = var.traffic_manager.name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  for_each = var.app_services

  name                = each.value.name
  profile_name        = azurerm_traffic_manager_profile.tm.name
  resource_group_name = var.traffic_manager.resource_group
  target_resource_id  = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.value.resource_group}/providers/Microsoft.Web/sites/${each.value.name}"
  type                = "azureEndpoints"
  endpoint_location   = each.value.location
  priority            = 1
}

data "azurerm_client_config" "current" {}
