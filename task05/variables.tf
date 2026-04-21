variable "resource_groups" {
  description = "A list of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = string
  }))
}
variable "tags" {
  description = "A map of tags to assign to all resources."
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
  type        = string
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

variable "traffic_manager_name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "traffic_manager_routing_method" {
  description = "The routing method for the Traffic Manager profile."
  type        = string
}

variable "endpoints" {
  description = "A map of Azure endpoints to add to the Traffic Manager profile."
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number, 1)
  }))
  default = {}
}
