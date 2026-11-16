variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
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
  description = "A deployment instance identifier used in resource names."
}

variable "instance_short" {
  type        = string
  description = "A short identifier for the instance."
}

variable "location_short" {
  type        = string
  description = "A short identifier for the location."
}


variable "storage_account_name" {
  type        = string
  description = "The name of the storage account."
}

variable "log_analytics_name" {
  type        = string
  description = "The name of the log analytics workspace."
}

variable "container_app_image_tag" {
  type        = string
  description = "The immutable image tag to deploy from Azure Container Registry."
}

variable "email_user" {
  type        = string
  description = "Email account used by the contact form."
}

variable "email_password" {
  type        = string
  sensitive   = true
  description = "SMTP password or app password. Supply through TF_VAR_email_password or a secure pipeline secret."
}

variable "container_resource_allocation_details" {
  type = object({
    cpu    = string
    memory = string
  })
  description = "The resource allocation details for the container app, including CPU and memory."
}
