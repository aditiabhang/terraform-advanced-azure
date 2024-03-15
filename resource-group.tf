# Create a new resource group in East US region - Default Provider
resource "azurerm_resource_group" "demo-resource-group-east-us" {
  name     = "my-demo-resource-group-in-east-us"
  location = "East US"
}

# # Create a new resource group in Central US region - 'central-provider'
# resource "azurerm_resource_group" "demo-resource-group-central-us" {
#   name     = "my-demo-resource-group-in-central-us"
#   location = "Central US"
#   provider = azurerm.central-provider
# }

# Random String
resource "random_string" "demo-random-string" {
  length  = 16
  special = false
  upper  = false
}

# Azure Storage Account
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.demo-random-string.id}"
  resource_group_name      = azurerm_resource_group.demo-resource-group-east-us.name
  location                 = azurerm_resource_group.demo-resource-group-east-us.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}