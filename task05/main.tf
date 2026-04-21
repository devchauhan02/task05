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
  worker_count        = each.value.worker_count
  tags                = var.tags
}

module "app_service" {
  for_each = var.app_services

  source              = "./modules/app_service"
  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  service_plan_id     = module.app_service_plan[each.value.app_service_plan_key].id
  ip_restrictions     = var.ip_restrictions
  tags                = var.tags
}