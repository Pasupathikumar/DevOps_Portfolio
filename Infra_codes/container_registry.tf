locals {
  container_registry_name = "${var.container_registry_name}${var.project_name}${var.location_short}${var.instance_short}"
}

resource "azurerm_container_registry" "portfolio_container_registry" {
  name                = local.container_registry_name
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  location            = var.location
  sku                 = "Basic"

  depends_on = [
    azurerm_resource_group.portfolio_rg
  ]
}