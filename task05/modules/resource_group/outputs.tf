
output "resource_group_names" {
  description = "Resource group names"
  value       = [for rg in azurerm_resource_group.rg : rg.name]
}
