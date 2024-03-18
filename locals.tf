locals {
  # Use case 1: Shorten the names for more readability
  rg_name   = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

  # Use case 2: Common tags to be assigned in all resources
  service_name = "Demo Service"
  owner        = "Aditi Abhang - HashiCorp"
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

  # Use case 3: Terraform Dynamic or Conditional Expressions

  /* The expressions assigned to local value names can either be simple constants or 
    can be more complex expressions that transform or combine values from elsewhere in the module. */

  # Option 1: Equals (==) operator
  vnet_address_space = var.environment == "Learning_Environment" ? var.vnet_address_space_for_learning_environment : var.vnet_address_space_for_other_environments
  # Option 2: Not Equals (!=) operator
  # vnet_address_space = var.environment != "Learning_Environment" ? var.vnet_address_space_for_other_environments : var.vnet_address_space_for_learning_environment

}