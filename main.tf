module "rg" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "asp" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name     = each.value.name
  location = each.value.location
  rg_name  = module.rg[each.value.rg_key].name
  sku      = each.value.sku
  workers  = each.value.workers
  tags     = var.tags
}

module "app" {
  for_each = var.apps
  source   = "./modules/app_service"

  name     = each.value.name
  location = module.rg[each.value.rg_key].location
  rg_name  = module.rg[each.value.rg_key].name
  asp_id   = module.asp[each.value.asp_key].id
  tags     = var.tags
}

module "tm" {
  source = "./modules/traffic_manager"

  name    = var.traffic_manager.name
  rg_name = module.rg[var.traffic_manager.rg_key].name

  endpoints = {
    app1 = module.app["app1"].id
    app2 = module.app["app2"].id
  }
  tags = var.tags
}