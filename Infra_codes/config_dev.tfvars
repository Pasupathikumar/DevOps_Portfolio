resource_group_name            = "pk-rg"
project_name                   = "portfolio"
instance_count                 = "0001"
location                       = "westus2"
location_short                 = "wu2"
instance_short                 = "01"
sql_server_name                = "pk-sqlserver"
sql_database_name              = "pk-sqldb"
container_registry_name        = "pkcr"
container_app_name             = "pk-cap"
sql_server_admin_name          = "Pasupathikumar"
storage_account_name           = "pksa"
container_app_environment_name = "pk-cae"
container_resource_allocation_details = {
  cpu    = "0.5"
  memory = "1.0Gi"
}
log_analytics_name = "pk-law"
registry_activate  = false

#pkcrportfoliowus201