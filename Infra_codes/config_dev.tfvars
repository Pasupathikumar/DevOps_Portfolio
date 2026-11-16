resource_group_name            = "pk-rg"
project_name                   = "portfolio"
instance_count                 = "0001"
location                       = "westus2"
location_short                 = "wu2"
instance_short                 = "01"
container_registry_name        = "pkcr"
container_app_name             = "pk-cap"
storage_account_name           = "pksa"
container_app_environment_name = "pk-cae"
container_resource_allocation_details = {
  cpu    = "0.5"
  memory = "1.0Gi"
}
log_analytics_name = "pk-law"
container_app_image_tag = "v1"
email_user              = "kumarmarimuthu99@gmail.com"

# Do not store the SMTP password in this file.
# Supply it securely with: $env:TF_VAR_email_password = "your-app-password"
