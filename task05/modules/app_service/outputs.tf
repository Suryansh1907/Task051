
output "app_service_names" {
  description = "App service names"
  value       = [for app in azurerm_windows_web_app.app : app.name]
}
