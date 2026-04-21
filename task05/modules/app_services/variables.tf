variable "name" {
  description = "The name of the App Service."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to which the App Service belongs."
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

variable "tags" {
  description = "A map of tags to assign to the App Service."
  type        = map(string)
  default     = {}
}