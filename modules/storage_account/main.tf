resource "azurerm_storage_account" "storage" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_kind                   = "StorageV2"
  account_replication_type        = "LRS"
  is_hns_enabled                  = true
  access_tier                     = "Hot"
  public_network_access_enabled   = true
  allow_nested_items_to_be_public = false

  tags = var.tags

  blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.containers)
  name                  = each.value
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
