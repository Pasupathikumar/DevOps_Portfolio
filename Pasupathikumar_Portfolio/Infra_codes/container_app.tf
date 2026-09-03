locals {
  container_app_environment_name = "${var.container_app_environment_name}-${var.project_name}-${var.location_short}-${var.instance_short}"
  container_app_name             = "${var.container_app_name}-${var.project_name}-${var.location_short}-${var.instance_short}"
}

resource "azurerm_container_app_environment" "cae_o1" {
  name                       = local.container_app_environment_name
  location                   = var.location
  resource_group_name        = azurerm_resource_group.portfolio_rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_o1.id
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}

resource "azurerm_container_app" "container_app_o1" {
  name                         = local.container_app_name
  container_app_environment_id = azurerm_container_app_environment.cae_o1.id
  resource_group_name          = azurerm_resource_group.portfolio_rg.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"

  dynamic "registry" {
    for_each = var.registry_activate == true ? [azurerm_container_registry.portfolio_container_registry.name] : []
    content {
      server   = "${registry.value}.azurecr.io"
      identity = "system"
    }
  }
  template {
    min_replicas = 2
    max_replicas = 10
    container {
      name = "mspk-portfolio-container"
      image = (
        var.container_app_image_tag == "" ?
        "mcr.microsoft.com/k8se/quickstart:latest" :
        "${azurerm_container_registry.portfolio_container_registry.name}.azurecr.io/mspk-portfolio-container:${var.container_app_image_tag}"
      )

      env {
        name  = "ASPNETCORE_ENVIRONMENT"
        value = "Production"
      }

      env {
        name  = "EMAIL_USER"
        value = "kumarmarimuthu99@mail.com"
      }

      cpu    = var.container_resource_allocation_details.cpu
      memory = var.container_resource_allocation_details.memory
    }
  }

}