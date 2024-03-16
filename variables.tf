# Vairable - Business unit 
variable "business_unit" {
  description = "The business unit for the environment"
  type        = string
  default     = "Customer_Support"
}

# Vairable - Environment
variable "environment" {
  description = "The environment for the deployment"
  type        = string
  default     = "Learning_Environment"
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