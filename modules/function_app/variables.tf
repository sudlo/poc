variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "service_plan_id" {}
variable "storage_account_name" {}
variable "storage_account_access_key" {}
variable "storage_key_vault_secret_id" {}
variable "storage_uses_managed_identity" { type = bool }
variable "key_vault_reference_identity_id" {}
variable "https_only" { type = bool }
variable "enabled" { type = bool }
variable "client_certificate_enabled" { type = bool }
variable "client_certificate_mode" {}
variable "public_network_access_enabled" { type = bool }
variable "builtin_logging_enabled" { type = bool }
variable "zip_deploy_file" {}
variable "tags" { type = map(string) }

variable "site_config" {
  type = object({
    always_on                   = bool
    api_definition_url          = string
    ftps_state                  = string
    health_check_path           = string
    http2_enabled               = bool
    minimum_tls_version         = string
    runtime_scale_monitoring_enabled = bool
    use_32_bit_worker           = bool
    worker_count                = number
    websockets_enabled          = bool
    load_balancing_mode         = string
    cors = object({
      allowed_origins     = list(string)
      support_credentials = bool
    })
  })
}
