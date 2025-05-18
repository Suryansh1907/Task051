
output "app_service_plan_names" {
  description = "App Service Plan names"
  value       = [for asp in azurerm_service_plan.asp : asp.name]
}
