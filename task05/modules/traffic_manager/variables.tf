variable "name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Traffic Manager profile."
  type        = string
}

variable "traffic_routing_method" {
  description = "The traffic routing method for the Traffic Manager profile (e.g., Performance, Weighted, Priority)."
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

variable "tags" {
  description = "A map of tags to assign to the Traffic Manager profile."
  type        = map(string)
  default     = {}
}