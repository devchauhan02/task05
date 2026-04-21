variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  type = map(object({
    name     = string
    location = string
    sku      = string
    workers  = number
    rg_key   = string
  }))
}

variable "apps" {
  type = map(object({
    name    = string
    rg_key  = string
    asp_key = string
  }))
}

variable "traffic_manager" {
  type = object({
    name   = string
    rg_key = string
  })
}
variable "tags" {
  type = string
}