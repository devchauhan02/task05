resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.asp_id

  site_config {
    ip_restriction {
      name       = "allow-ip"
      ip_address = "18.153.146.156"
      action     = "Allow"
    }

    ip_restriction {
      name        = "allow-tm"
      service_tag = "AzureTrafficManager"
      action      = "Allow"
    }

    ip_restriction_default_action = "Deny"
  }

  tags = {
    Creator = var.tags
  }
}