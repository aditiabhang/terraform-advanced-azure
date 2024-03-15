terraform {
  cloud {
    organization = "hashicorp-support-eng"

    workspaces {
      name = "terraform-advanced-learning"
    }
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    #   version = "3.96.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

# Default Provider-1 block in Central US 
provider "azurerm" {
    features {}
}

# # Provider-2 block in East US 
# provider "azurerm" {
#     alias = "central-provider"
#     features {}
# }
