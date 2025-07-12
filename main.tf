terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.35.0"
    }
  }
}

# Provider configuration
provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "function_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_kind             = var.storage_account_kind
  account_replication_type = var.storage_account_replication
}

# Storage Containers
resource "azurerm_storage_container" "containers" {
  for_each              = toset(var.containers)
  name                  = each.value
  storage_account_id    = azurerm_storage_account.function_storage.id
  container_access_type = "private"
}

# App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.app_service_plan_location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.sku_name
  os_type             = "Linux"
}

# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = var.app_insights_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

# Function App Module
module "spirit_function_app" {
  source = "./modules/function_app"

  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  storage_key_vault_secret_id = var.storage_key_vault_secret_id
  storage_uses_managed_identity = var.storage_uses_managed_identity
  key_vault_reference_identity_id = var.key_vault_reference_identity_id
  https_only                 = var.https_only
  enabled                    = var.enabled
  client_certificate_enabled = var.client_certificate_enabled
  client_certificate_mode    = var.client_certificate_mode
  public_network_access_enabled = var.public_network_access_enabled
  builtin_logging_enabled    = var.builtin_logging_enabled
  zip_deploy_file            = var.zip_deploy_file
  tags                       = var.tags

  site_config = var.site_config
}


# Host Keys (ensure Function App is healthy first)
data "azurerm_function_app_host_keys" "spirit" {
  name                = module.function_app.function_app_names["spirit-test-func-app"]
  resource_group_name = var.resource_group_name

  depends_on = [module.function_app]
}

# Output: Default Host Key
output "default_function_key" {
  value     = data.azurerm_function_app_host_keys.spirit.default_function_key
  sensitive = true
}
