locals {
  app_service_plan_name = join("-", [var.location_code, "asp", var.service_name, var.environment, var.instance_number])
  app_service_name      = join("-", [var.location_code, "app", var.service_name, var.environment, var.instance_number])
  keyvault_name         = join("-", [var.location_code, "kv", var.service_name, var.environment, var.instance_number])
  sql_server_name       = join("-", [var.location_code, "mssql", var.service_name, var.environment, var.instance_number])
  sql_database_name     = join("-", [var.location_code, "mssqldb", var.service_name, var.environment, var.instance_number])
  sql_username          = "sqladmin"
  location              = data.azurerm_resource_group.resourcegroup.location
  tags = {
    service     = var.service_name
    owner       = var.owner
    costcode    = var.cost_code
    environment = var.environment
  }
}