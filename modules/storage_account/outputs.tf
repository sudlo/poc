output "storage_account_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "primary_access_key" {
  description = "The primary access key of the storage account"
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
}

output "resource_group_name" {
  value = azurerm_storage_account.storage.resource_group_name
}

output "primary_connection_string" {
  value     = azurerm_storage_account.storage.primary_connection_string
  sensitive = true
}
