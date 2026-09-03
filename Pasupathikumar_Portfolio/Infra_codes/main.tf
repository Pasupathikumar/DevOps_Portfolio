terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-01"
    storage_account_name = "tfstterraform01"
    container_name       = "portfolio-infra-container-01"
    key                  = "pasupathikumar-portfolio-terraform.tfstate"
    use_azuread_auth     = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}