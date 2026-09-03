variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}
variable "sql_server_name" {
  type        = string
  description = "The name of the SQL server."
}

variable "sql_database_name" {
  type        = string
  description = "The name of the SQL database."
}

variable "container_registry_name" {
  type        = string
  description = "The name of the container registry."
}

variable "container_app_name" {
  type        = string
  description = "The name of the container app."
}

variable "container_app_environment_name" {
  type        = string
  description = "The name of the container app environment."
}

variable "project_name" {
  type        = string
  description = "The name of the project."
}

variable "location" {
  type        = string
  description = "The location for all resources."
}

variable "instance_count" {
  type        = string
  description = "The number of instances for the AKS cluster."
}

variable "instance_short" {
  type        = string
  description = "A short identifier for the instance."
}

variable "location_short" {
  type        = string
  description = "A short identifier for the location."
}

variable "sql_server_admin_name" {
  type        = string
  description = "The administrator login name for the SQL server."
}

variable "sql_server_admin_password" {
  type        = string
  description = "The administrator login password for the SQL server."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account."
}

variable "log_analytics_name" {
  type        = string
  description = "The name of the log analytics workspace."
}

variable "registry_activate" {
  type        = bool
  description = "Whether to activate the container registry."

}

variable "container_app_image_tag" {
  type        = string
  description = "The image tag for the container app. If empty, the latest image from MCR will be used."
}

variable "container_resource_allocation_details" {
  type = object({
    cpu    = string
    memory = string
  })
  description = "The resource allocation details for the container app, including CPU and memory."
}