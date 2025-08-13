resource "azurerm_log_analytics_workspace" "monitoring" {
  name = "otlp-laworkspace"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_application_insights" "monitoring" {
  name = "oltp-appinsights"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type = "web"
  workspace_id = azurerm_log_analytics_workspace.monitoring.id
}

output "app_insights_connection_string" {
  value = azurerm_application_insights.monitoring.connection_string
  sensitive = true
}

output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.monitoring.instrumentation_key
  sensitive = true
}