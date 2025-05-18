
variable "resource_groups" {
  description = "Map of resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "Common tags for the resource groups"
  type        = map(string)
}
