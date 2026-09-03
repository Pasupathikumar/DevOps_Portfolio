# locals {
#   sql_server_name   = "${var.sql_server_name}-${var.project_name}-${var.location}-${var.instance_count}"
#   sql_database_name = "${var.sql_database_name}-${var.project_name}-${var.location_short}-${var.instance_short}"
# }

# resource "azurerm_mssql_server" "portfolio_sql_server" {
#   name                         = local.sql_server_name
#   resource_group_name          = azurerm_resource_group.portfolio_rg.name
#   location                     = var.location
#   version                      = "12.0"
#   administrator_login          = var.sql_server_admin_name
#   administrator_login_password = var.sql_server_admin_password

#   depends_on = [azurerm_resource_group.portfolio_rg]
# }

# resource "azurerm_mssql_database" "portfolio_sql_database" {
#   name         = local.sql_database_name
#   server_id    = azurerm_mssql_server.portfolio_sql_server.id
#   sku_name     = "GP_S_Gen5_1"
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   license_type = "LicenseIncluded"
#   max_size_gb  = 2

#   auto_pause_delay_in_minutes = 60
#   min_capacity                = 0.5

#   depends_on = [azurerm_mssql_server.portfolio_sql_server]
# }