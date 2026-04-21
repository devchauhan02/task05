variable "resource_groups" {
  description = "A list of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = string
  }))
}
variable "tags" {
  type = map(string)
}

variable "app_service_plans" {
  description = "A map of App Service Plan configurations to create."
  type = map(object({
    name               = string
    resource_group_key = string
    sku_name           = string
    worker_count       = number
  }))
}

variable "os_type" {
  description = "The operating system type for the App Service Plan (e.g., 'Windows' or 'Linux')."
  type = string
}

variable "ip_restrictions" {
  description = "List of IP restriction rules for the App Service."
  type = list(object({
    name        = string
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
    priority    = number
  }))
  default = []
}

variable "app_services" {
  description = "A map of Windows Web App configurations to create."
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}