variable "resource_group_name" {
  type        = string
  description = "description"
}

variable "location" {
  type        = string
  description = "description"
}

variable "sql_server_name" {
  type        = string
  description = "description"
}

variable "sql_database_name" {
  type        = string
  description = "description"
}

variable "sql_username" {
  type        = string
  description = "description"
}

variable "sql_password" {
  type        = string
  description = "description"
}

variable "tags" {
  type        = map(string)
  description = "tagging for resources"
}