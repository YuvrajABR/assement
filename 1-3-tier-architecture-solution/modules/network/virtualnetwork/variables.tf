variable "resource_group_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
}

variable "location" {
  type        = string
  default     = ""
  description = "location for vnet"
}

variable "address_vnet_space" {
  type        = string
  default     = ["10.254.0.0/16"]
  description = "vnet adddress space"
}

variable "address_subnet_space" {
  type        = list(string)
  default     = ["10.254.0.0/24"]
  description = "subnet adddress space"
}

