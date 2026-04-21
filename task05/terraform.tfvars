resource_groups = {
  rg1 = {
    name     = "cmaz-49e4rswo-mod5-rg-01"
    location = "westeurope"
    tags     = "devashish_chauhan@epam.com"
  }
  rg2 = {
    name     = "cmaz-49e4rswo-mod5-rg-02"
    location = "northeurope"
    tags     = "devashish_chauhan@epam.com"
  }
  rg3 = {
    name     = "cmaz-49e4rswo-mod5-rg-03"
    location = "canadaeast"
    tags     = "devashish_chauhan@epam.com"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-49e4rswo-mod5-asp-01"
    resource_group_key = "rg1"
    sku_name           = "S1"
    worker_count       = 2
  }
  asp2 = {
    name               = "cmaz-49e4rswo-mod5-asp-02"
    resource_group_key = "rg2"
    sku_name           = "S1"
    worker_count       = 1
  }
}

os_type = "Windows"

app_services = {
  app1 = {
    name                 = "cmaz-49e4rswo-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  }
  app2 = {
    name                 = "cmaz-49e4rswo-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

ip_restrictions = [
  {
    name       = "allow-ip"
    action     = "Allow"
    priority   = 100
    ip_address = "18.153.146.156/32"
  },
  {
    name        = "allow-tm"
    action      = "Allow"
    priority    = 200
    service_tag = "AzureTrafficManager"
  }
]

tags = {
  Creator = "devashish_chauhan@epam.com"
}