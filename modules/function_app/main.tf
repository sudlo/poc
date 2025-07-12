resource "azurerm_linux_function_app" "this" {
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

  site_config {
    always_on                     = var.site_config.always_on
    api_definition_url            = var.site_config.api_definition_url
    ftps_state                    = var.site_config.ftps_state
    health_check_path             = var.site_config.health_check_path
    http2_enabled                 = var.site_config.http2_enabled
    minimum_tls_version           = var.site_config.minimum_tls_version
    runtime_scale_monitoring_enabled = var.site_config.runtime_scale_monitoring_enabled
    use_32_bit_worker             = var.site_config.use_32_bit_worker
    worker_count                  = var.site_config.worker_count
    websockets_enabled            = var.site_config.websockets_enabled
    load_balancing_mode           = var.site_config.load_balancing_mode
    cors {
      allowed_origins     = var.site_config.cors.allowed_origins
      support_credentials = var.site_config.cors.support_credentials
    }
  }
}
