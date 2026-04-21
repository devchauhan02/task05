resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = var.sku
  worker_count        = var.workers

  os_type = "Windows"

  tags = {
    Creator = var.tags
  }
}