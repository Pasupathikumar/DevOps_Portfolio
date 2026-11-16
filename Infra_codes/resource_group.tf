locals {
  resource_group_name = "${var.resource_group_name}-${var.project_name}-${var.location}-${var.instance_count}"
}

resource "azurerm_resource_group" "portfolio_rg" {
  name     = local.resource_group_name
  location = var.location
}