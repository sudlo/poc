resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.app_service_plan_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
}

output "id" {
  value = azurerm_service_plan.this.id
}
