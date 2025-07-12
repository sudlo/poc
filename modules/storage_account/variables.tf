variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
 
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
 
variable "location" {
  description = "The Azure location for the storage account"
  type        = string
}
 
variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}
variable "containers" {
  type = list(string)
  description = "List of container names"
}
variable "storage_account_kind" {
  description = "The kind of storage account to create"
  type        = string
  default     = "StorageV2"  # Optional: Provide a default value
}

variable "storage_account_sku" {
  description = "The SKU (pricing tier) of the storage account"
  type        = string
  default     = "Standard_LRS"  # Optional
}

