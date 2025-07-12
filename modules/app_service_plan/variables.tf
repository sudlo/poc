variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "app_service_plan_location" {
  description = "The Azure region for the App Service Plan"
  type        = string
}

variable "os_type" {
  description = "The OS type for the App Service Plan (Linux or Windows)"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name of the App Service Plan"
  type        = string
  default     = "P1v2"
}


variable "tags" {
  description = "A map of tags to associate with the App Service Plan"
  type        = map(string)
  default     = {}
}
variable "location" {
  description = "The Azure location for the App Service Plan"
  type        = string
}
variable "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  type        = string
  default     = null
}
