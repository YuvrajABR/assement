variable "resource_group_name" {
  type        = string
  default     = "azus-rg-ardemo-001"
  description = "resource group for resources"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "location of the resources"
}

variable "app_service_plan_name" {
  type        = string
  description = "name app service plan"
}

variable "app_service_name" {
  type        = string
  description = "name app service"
}

variable "app_service_plan_os" {
  type        = string
  default     = "Windows"
  description = "app service plan os type"
}
variable "sku_name" {
  type        = string
  default     = "S1"
  description = "app service sku"
}
variable "tags" {
  type        = map(string)
  description = "resource tagging"
}