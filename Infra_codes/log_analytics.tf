locals {
  log_analytics_name = "${var.log_analytics_name}-${var.project_name}-${var.location_short}-${var.instance_short}"
}

resource "azurerm_log_analytics_workspace" "log_analytics_o1" {
  name                = local.log_analytics_name
  location            = var.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  sku                 = "PerGB2018"
}