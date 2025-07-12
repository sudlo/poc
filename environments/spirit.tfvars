# Tenant and Subscription
tenant_id       = "ad551a82-94b6-4026-a42c-ff46bc2c92c7"
subscription_id = "1368405a-9b5b-4242-a39b-3b4fe838ad7a"

# Resource Group
resource_group_name     = "Function-App-Test-RG"
location                = "East US 2"

# Storage Account
storage_account_name         = "funcapptoragetest"
storage_account_tier        = "Standard"
storage_account_replication = "LRS"
storage_account_kind        = "StorageV2"
containers                  = ["test"]

# App Service Plan
app_service_plan_name     = "ASP-Func-App-Test"
app_service_plan_location = "East US 2"
sku_name                  = "P2mv3"

# Application Insights
app_insights_name     = "spirit-test-func-app-ai"
app_insights_location = "East US 2"

# Function Apps (List of One)
name                = "spiritttest"
location            = "eastus2"
resource_group_name = "Function-App-Test-RG"
service_plan_id     = "/subscriptions/1368405a-.../serverFarms/ASP-Func-App-Test"
storage_account_name = ""
storage_account_access_key = ""
storage_key_vault_secret_id = ""
storage_uses_managed_identity = false
key_vault_reference_identity_id = "SystemAssigned"
https_only         = true
enabled            = true
client_certificate_enabled = false
client_certificate_mode = "Required"
public_network_access_enabled = true
builtin_logging_enabled = false
zip_deploy_file    = ""

tags = {
  "hidden-link: /app-insights-resource-id" = "/subscriptions/1368405a-.../components/spirittest"
}

site_config = {
  always_on                   = true
  api_definition_url          = ""
  ftps_state                  = "FtpsOnly"
  health_check_path           = ""
  http2_enabled               = false
  minimum_tls_version         = "1.2"
  runtime_scale_monitoring_enabled = false
  use_32_bit_worker           = false
  worker_count                = 1
  websockets_enabled          = false
  load_balancing_mode         = "LeastRequests"
  cors = {
    allowed_origins     = ["https://portal.azure.com"]
    support_credentials = false
  }
}

# ACR
acr_name           = "sdsspiritpolaris"
acr_sku            = "Standard"
acr_admin_enabled  = false # Disabled for managed identity