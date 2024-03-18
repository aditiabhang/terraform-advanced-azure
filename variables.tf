# Vairable - Business unit 
variable "business_unit" {
  description = "The business unit"
  type        = string
  default     = "Customer_Support"
}

# Vairable - Environment
variable "environment" {
  description = "The environment for the deployment"
  type        = string
  default     = "Learning_Environment"
  #   default = "Development_Environment"
}

# Variable - Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "Demo_Resource_Group"
}

# Variable - Resource Group Location
variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

# Variable - Virtual Network Name
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "Demo_VNET"
}

# Variable - Virtual Network Address for Customer Support Business Unit
variable "vnet_address_space_for_learning_environment" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Variable - Virtual Network Address for All Other Business Units (except Customer Support)
variable "vnet_address_space_for_other_environments" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.1.0.0/24", "10.2.0.0/16", "10.3.0.0.0/16"]
}