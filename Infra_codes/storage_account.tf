locals {
  storage_account_name = "${var.storage_account_name}${var.project_name}${var.location}${var.instance_count}"
}

resource "azurerm_storage_account" "name" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.portfolio_rg.name
  location                 = azurerm_resource_group.portfolio_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}