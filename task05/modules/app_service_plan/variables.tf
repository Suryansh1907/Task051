
variable "app_service_plans" {
  description = "Map of app service plans"
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    sku_name       = string
    worker_count   = number
  }))
}

variable "tags" {
  description = "Common tags for app service plans"
  type        = map(string)
}
