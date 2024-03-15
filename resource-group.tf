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
resource "random_string" "random-string" {
  length  = 8
  special = false
  upper  = false
}