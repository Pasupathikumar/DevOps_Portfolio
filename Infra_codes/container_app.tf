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

  #registry {
  #  server   = "${azurerm_container_registry.portfolio_container_registry.name}.azurecr.io"
  #  identity = azurerm_user_assigned_identity.container_app.id
  #}

  secret {
    name  = "email-password"
    value = var.email_password
  }

  template {
    min_replicas = 0
    max_replicas = 10
    container {
      name = "mspk-portfolio-container"
      image = "${azurerm_container_registry.portfolio_container_registry.name}.azurecr.io/mspk-portfolio-container:${var.container_app_image_tag}"

      env {
        name  = "ASPNETCORE_ENVIRONMENT"
        value = "Production"
      }

      env {
        name  = "EMAIL_USER"
        value = var.email_user
      }

      env {
        name        = "EMAIL_PASSWORD"
        secret_name = "email-password"
      }

      cpu    = var.container_resource_allocation_details.cpu
      memory = var.container_resource_allocation_details.memory
    }
  }

  identity {
    type = "SystemAssigned"
  }

  ingress {
    external_enabled           = true
    target_port                = 8080
    allow_insecure_connections = false
    client_certificate_mode    = "Ignore"
    transport                  = "auto"
    traffic_weight {
      latest_revision = true
      weight          = 100
    }
  }

  depends_on = [azurerm_role_assignment.container_app_role_assignment_acr]
}

resource "azurerm_role_assignment" "storage_account_role_assignment" {
  principal_id         = azurerm_user_assigned_identity.container_app.principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.portfolio_storage_account.id
}

resource "azurerm_role_assignment" "container_app_role_assignment_acr" {
  principal_id         = azurerm_user_assigned_identity.container_app.principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.portfolio_container_registry.id
}
