
variable "app_services" {
  description = "Map of app services"
  type = map(object({
    name             = string
    location         = string
    resource_group   = string
    app_service_plan = string
  }))
}

variable "allowed_ip" {
  description = "Allowed IP for verification agent"
  type        = string
}

variable "tags" {
  description = "Common tags for app services"
  type        = map(string)
}
