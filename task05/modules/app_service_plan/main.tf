
resource "azurerm_service_plan" "asp" {
  for_each = var.app_service_plans

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  sku_name            = each.value.sku_name
  os_type             = "Windows"
  worker_count        = each.value.worker_count

  tags = var.tags
}
