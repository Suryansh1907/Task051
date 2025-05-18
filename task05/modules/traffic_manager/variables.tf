
variable "traffic_manager" {
  description = "Traffic Manager profile configuration"
  type = object({
    name           = string
    resource_group = string
    routing_method = string
  })
}

variable "app_services" {
  description = "Map of app services"
  type = map(object({
    name             = string
    location         = string
    resource_group   = string
    app_service_plan = string
  }))
}

variable "tags" {
  description = "Common tags for traffic manager"
  type        = map(string)
}
