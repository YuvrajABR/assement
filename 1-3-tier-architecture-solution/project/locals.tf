locals {
  location_code = {
    eastus = "azus"
  }
  location = data.azurerm_resource_group.resourcegroup.location
}

locals {
  app_service_plan_name = join("-", [local.location_code[local.location], "asp", var.service_name, var.environment, var.instance_number])
  app_service_name      = join("-", [local.location_code[local.location], "app", var.service_name, var.environment, var.instance_number])
  keyvault_name         = join("-", [local.location_code[local.location], "kv", var.service_name, var.environment, var.instance_number])
  sql_server_name       = join("-", [local.location_code[local.location], "mssql", var.service_name, var.environment, var.instance_number])
  sql_database_name     = join("-", [local.location_code[local.location], "mssqldb", var.service_name, var.environment, var.instance_number])
  vnet_name             = join("-", [local.location_code[local.location], "vnet", var.service_name, var.environment, var.instance_number])
  tags = {
    service     = var.service_name
    owner       = var.owner
    costcode    = var.cost_code
    environment = var.environment
  }
}