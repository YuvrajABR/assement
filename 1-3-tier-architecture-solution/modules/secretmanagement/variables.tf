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

variable "keyvault_name" {
  type        = string
  description = "name of the keyvault"
}

variable "app_managed_identity" {
  type        = string
  description = "name of the keyvault"
}
variable "sql_managed_identity" {
  type        = string
  description = "name of the keyvault"
}
variable "sql_server_name" {
  type        = string
  description = "name of the keyvault"
}
variable "sql_password" {
  type        = string
  description = "name of the keyvault"
}

variable "tags" {
  type        = map(string)
  description = "resource tagging"
}