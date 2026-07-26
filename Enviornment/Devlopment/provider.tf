
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  
  backend "azurerm" {
    storage_account_name = "vodastg"
    resource_group_name  = "voda"
    container_name       = "tank"
    key                  = "parent.tfstate"
  }
}


provider "azurerm" {
  features {}
}
