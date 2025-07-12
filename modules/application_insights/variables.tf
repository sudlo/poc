variable "name" {
  description = "The name of the Application Insights resource (also used to name the workspace)"
  type        = string
}

variable "location" {
  description = "Azure region for both Application Insights and Workspace"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "application_type" {
  description = "Type of application (web, other, etc.)"
  type        = string
  default     = "web"
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}
