output "function_app_urls" {
  description = "URLs of all Function Apps"
  value       = module.function_app.function_app_urls
}

output "function_app_names" {
  description = "Names of all function apps"
  value       = module.function_app.function_app_names
}

# output "default_function_key" {
#   description = "Default function host key"
#   value       = data.azurerm_function_app_host_keys.spirit.default_function_key
#   sensitive   = true
# }

output "function_app_primary_key" {
  description = "Primary host key"
  value       = data.azurerm_function_app_host_keys.spirit.primary_key
  sensitive   = true
}