
variable "resource_groups" {
  description = "Map of resource group objects with name and location"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of App Service Plan properties"
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    sku_name       = string
    worker_count   = number
  }))
}

variable "app_services" {
  description = "Map of App Service properties"
  type = map(object({
    name             = string
    location         = string
    resource_group   = string
    app_service_plan = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager profile configuration"
  type = object({
    name           = string
    resource_group = string
    routing_method = string
  })
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "allowed_ip" {
  description = "Allowed IP address for verification agent"
  type        = string
}
