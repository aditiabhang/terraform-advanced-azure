# Datasource of Resource Group

data "azurerm_resource_group" "rg-datasource" {
  # Implicit dependency on the resource group. Resource group is created before fetching the details.
#   name = azurerm_resource_group.demo-resource-group-east-us.name

  # Explicit dependency on the resource group. Details depends on the resource group creation.
    depends_on = [azurerm_resource_group.demo-resource-group-east-us]
    name = local.rg_name # Not a resource-specific value. It is a local value.
}

# Output - Resource Group Details
output "resource_group_details" {
  value = data.azurerm_resource_group.rg-datasource
}

# Output - Resource Group ID
output "resource_group_id" {
  value = data.azurerm_resource_group.rg-datasource.id
}

# Output - Resource Group Location
output "resource_group_location" {
  value = data.azurerm_resource_group.rg-datasource.location
}


