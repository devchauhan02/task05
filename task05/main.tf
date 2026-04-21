module "resource_group" {
  for_each = var.resource_groups

  source   = "./modules/resource_group"
  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "app_service_plan" {
  for_each = var.app_service_plans

  source              = "./modules/app_service_plan"
  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  sku_name            = each.value.sku_name
  os_type             = each.value.os_type
  worker_count        = each.value.worker_count
  tags                = var.tags
}

module "app_service" {
  for_each = var.app_services

  source              = "./modules/app_service"
  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  app_service_plan_id = module.app_service_plan[each.value.app_service_plan_key].id
  ip_restrictions     = var.ip_restrictions
  tags                = var.tags
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                   = var.traffic_manager_name
  resource_group_name    = module.resource_group["rg3"].name
  traffic_routing_method = var.traffic_manager_routing_method
  tags                   = var.tags

  endpoints = {
    for key, app in var.app_services : key => {
      name               = module.app_service[key].name
      target_resource_id = module.app_service[key].id
    }
  }
}