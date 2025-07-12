resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.name}-ws"  # Example: spirit-prod-ai-ws
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type

  workspace_id        = azurerm_log_analytics_workspace.this.id  # Auto-link to created workspace
  tags                = var.tags
}
