# Resource - Virtual Network
resource "azurerm_virtual_network" "demo-vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
  location            = azurerm_resource_group.demo-resource-group-east-us.location
  address_space       = local.vnet_address_space
  tags                = local.common_tags
}

# Resource - Virtual Network using Conditional Expression
resource "azurerm_virtual_network" "demo-vnet-conditional-expression" {
  count               = var.environment == "Learning_Environment" ? 1 : 3
  name                = "${local.vnet_name}-${count.index + 1}"
  resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
  location            = azurerm_resource_group.demo-resource-group-east-us.location
  address_space       = local.vnet_address_space
  tags                = local.common_tags
}

# Resource - Subnet
resource "azurerm_subnet" "demo-subnet" {
  name                 = "Demo-Subnet"
  resource_group_name  = azurerm_resource_group.demo-resource-group-east-us.name
  virtual_network_name = azurerm_virtual_network.demo-vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Resource - Public IP
resource "azurerm_public_ip" "demo-public-ip" {
  # Meta-Argument: depends_on - explicit dependency
  depends_on          = [azurerm_virtual_network.demo-vnet, azurerm_subnet.demo-subnet]

  name                = "Demo-Public-IP"
  resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
  location            = azurerm_resource_group.demo-resource-group-east-us.location
  allocation_method   = "Dynamic"

  domain_name_label = "app1-vm-${random_string.demo-random-string.id}"
}

# Resource - Network Interface
resource "azurerm_network_interface" "demo-network-interface" {
  name                = "Demo-NIC"
  resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
  location            = azurerm_resource_group.demo-resource-group-east-us.location
  ip_configuration {
    name                          = "Demo-IP-Config"
    subnet_id                     = azurerm_subnet.demo-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.demo-public-ip.id
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