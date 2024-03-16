# Resource - Virtual Network
resource "azurerm_virtual_network" "demo-vnet" {
    name                = local.vnet_name
    resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
    location            = azurerm_resource_group.demo-resource-group-east-us.location
    address_space       = ["10.0.0.0/16"]
    tags = local.common_tags
}

# Resource - Subnet
resource "azurerm_subnet" "demo-subnet" {
    name                 = "my-demo-subnet"
    resource_group_name  = azurerm_resource_group.demo-resource-group-east-us.name
    virtual_network_name = azurerm_virtual_network.demo-vnet.name
    address_prefixes     = ["10.0.0.0/24"]
}

# Resource - Public IP
resource "azurerm_public_ip" "demo-public-ip" {
    name                = "my-demo-public-ip"
    resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
    location            = azurerm_resource_group.demo-resource-group-east-us.location
    allocation_method   = "Dynamic"
}

# Resource - Network Interface
resource "azurerm_network_interface" "demo-network-interface" {
    name = "my-demo-network-interface"
    resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
    location = azurerm_resource_group.demo-resource-group-east-us.location
    ip_configuration {
        name                          = "demo-ip-config"
        subnet_id                     = azurerm_subnet.demo-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.demo-public-ip.id
    }
}
# module "vnet" {
#   source  = "Azure/vnet/azurerm"
#   version = "4.1.0"

#   // Add your input variables here, for example:
#   resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
#   address_space       = ["10.0.0.0/16"]
#   vnet_name           = "demo-vnet"
#   vnet_location       = "East US"
#   use_for_each        = true
#   subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   subnet_names        = ["subnet1", "subnet2", "subnet3"]

#   subnet_service_endpoints = {
#     subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
#     subnet3 = ["Microsoft.AzureActiveDirectory"]
#   }
# }