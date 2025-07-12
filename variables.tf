# Azure Provider Auth
variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Default location for resources"
  type        = string
}

# Storage Account
variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage account tier (e.g., Standard)"
  type        = string
  default     = "Standard"
}

variable "storage_account_kind" {
  description = "Storage account kind (e.g., StorageV2)"
  type        = string
  default     = "StorageV2"
}

variable "storage_account_replication" {
  description = "Storage replication type (e.g., LRS)"
  type        = string
  default     = "LRS"
}

variable "containers" {
  description = "List of storage containers to create"
  type        = list(string)
}

# App Service Plan
variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_service_plan_location" {
  description = "Location for App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "SKU for the App Service Plan (e.g., Y1 for consumption, EP1 for premium)"
  type        = string
}

# Application Insights
variable "app_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
}

variable "app_insights_location" {
  description = "Location for Application Insights"
  type        = string
}

# Azure Container Registry (ACR)
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU of the ACR (e.g., Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "acr_admin_enabled" {
  description = "Enable admin access to ACR"
  type        = bool
  default     = true
}

# AzureWebJobsStorage (full connection string)
variable "azure_web_jobs_storage" {
  description = "AzureWebJobsStorage connection string"
  type        = string
}

# Function Apps Configuration (passed to module)
variable "name" {
  description = "The name of the Function App."
  type        = string
}

# variable "location" {
#   description = "Azure region where the Function App will be deployed."
#   type        = string
# }

# variable "resource_group_name" {
#   description = "The name of the resource group in which to create the Function App."
#   type        = string
# }

variable "service_plan_id" {
  description = "The ID of the App Service Plan to use for the Function App."
  type        = string
}

# variable "storage_account_name" {
#   description = "The name of the Storage Account to link with the Function App."
#   type        = string
# }

variable "storage_account_access_key" {
  description = "Access key for the Storage Account."
  type        = string
}

variable "storage_key_vault_secret_id" {
  description = "Key Vault secret ID for the Storage Account connection string."
  type        = string
}

variable "storage_uses_managed_identity" {
  description = "Whether the Function App uses managed identity for storage."
  type        = bool
}

variable "key_vault_reference_identity_id" {
  description = "Managed identity ID used for accessing Key Vault references."
  type        = string
}

variable "https_only" {
  description = "Force HTTPS only traffic to the Function App."
  type        = bool
}

variable "enabled" {
  description = "Whether the Function App is enabled."
  type        = bool
}

variable "client_certificate_enabled" {
  description = "Enable client certificate authentication."
  type        = bool
}

variable "client_certificate_mode" {
  description = "Client certificate mode (e.g., 'Required', 'Optional')."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether the Function App is accessible via public network."
  type        = bool
}

variable "builtin_logging_enabled" {
  description = "Enable built-in logging."
  type        = bool
}

variable "zip_deploy_file" {
  description = "The path to the zip file to deploy to the Function App."
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the Function App."
  type        = map(string)
}

variable "site_config" {
  description = "Configuration block for Function App site settings."
  type = object({
    always_on                         = bool
    api_definition_url                = string
    ftps_state                        = string
    health_check_path                 = string
    http2_enabled                     = bool
    minimum_tls_version               = string
    runtime_scale_monitoring_enabled = bool
    use_32_bit_worker                 = bool
    worker_count                      = number
    websockets_enabled                = bool
    load_balancing_mode               = string
    cors = object({
      allowed_origins     = list(string)
      support_credentials = bool
    })
  })
}
