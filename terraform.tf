terraform {
  cloud {
    organization = "hashicorp-support-eng"

    workspaces {
      name = "terraform-advanced-learning"
    }
  }

  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo-rg" {
  name     = "demo-resource-group"
  location = "East US"
}
