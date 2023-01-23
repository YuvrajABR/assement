variable "subscription_id" {
  type        = string
  default     = "a7182fd1-47ef-47ec-b60a-3e04874d4e90"
  description = "subscription id for resources"
}

variable "resource_group_name" {
  type        = string
  default     = "azus-rg-ardemo-001"
  description = "resource group for resources"
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
variable "sql_username" {
  type        = string
  default     = "sqladmin"
  description = "sql server username"
}

variable "instance_number" {
  type        = string
  default     = "001"
  description = "number for resource number, to identify if multiple resource for same service."
}

variable "service_name" {
  type        = string
  default     = "arcdemo"
  description = "resources for service/project name"
}

variable "owner" {
  type        = string
  default     = "Yuvraj"
  description = "resources for service/project name"
}

variable "cost_code" {
  type        = string
  default     = "free"
  description = "resources for service/project name"
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "environment ex:- dev, preprod or prod"
}