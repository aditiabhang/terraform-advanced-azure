# Datasource - Subscription
data "azurerm_subscription" "current" {
}

# Output - Subscription Name
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

# Output - Subscription Spending Limit
output "current_subscription_spending_limit" {
  value = data.azurerm_subscription.current.spending_limit
}