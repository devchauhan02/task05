resource_groups = {
  rg1 = { name = "cmaz-49e4rswo-mod5-rg-01", location = "eastus" }
  rg2 = { name = "cmaz-49e4rswo-mod5-rg-02", location = "westus" }
  rg3 = { name = "cmaz-49e4rswo-mod5-rg-03", location = "centralus" }
}

app_service_plans = {
  asp1 = {
    name     = "cmaz-49e4rswo-mod5-asp-01"
    location = "eastus"
    sku      = "S1"
    workers  = 2
    rg_key   = "rg1"
  }
  asp2 = {
    name     = "cmaz-49e4rswo-mod5-asp-02"
    location = "westus"
    sku      = "S1"
    workers  = 1
    rg_key   = "rg2"
  }
}

apps = {
  app1 = {
    name    = "cmaz-49e4rswo-mod5-app-01"
    rg_key  = "rg1"
    asp_key = "asp1"
  }
  app2 = {
    name    = "cmaz-49e4rswo-mod5-app-02"
    rg_key  = "rg2"
    asp_key = "asp2"
  }
}

traffic_manager = {
  name   = "cmaz-49e4rswo-mod5-traf"
  rg_key = "rg3"
}
tags = "devashish_chauhan@epam.com"