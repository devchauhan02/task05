variable "name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service Plan will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service Plan."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., S1, P1v2)."
  type        = string
}

variable "worker_count" {
  description = "The number of workers (instances) for the App Service Plan."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the App Service Plan."
  type        = map(string)
  default     = {}
}

variable "os_type" {
  description = "The operating system type for the App Service Plan (e.g., Windows, Linux)."
  type        = string
}



