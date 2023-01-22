resource "random_string" "random" {
  length           = 9
  min_upper        = 1
  min_lower        = 2
  special          = true
  override_special = "@"
}

data "azurerm_resource_group" "resourcegroup" {
  name = var.resource_group_name
}

data "azuread_service_principal" "app_sp" {
  display_name = local.app_service_name
  depends_on = [
    module.app_service
  ]
}

data "azuread_service_principal" "sql_server_sp" {
  display_name = local.app_service_name
  depends_on = [
    module.app_service
  ]
}

##  calling the app service module - creating app service plan and app service.
module "app_service" {
  source                = "../modules/appservice"
  resource_group_name   = var.resource_group_name
  location              = local.location
  app_service_plan_name = local.app_service_plan_name
  app_service_name      = local.app_service_name
  sku_name              = var.sku_name
  app_service_plan_os   = var.app_service_plan_os
  tags                  = local.tags
}

module "secret_management" {
  source               = "../modules/secretmanagement"
  depends_on           = [module.app_service, module.sql_database]
  resource_group_name  = var.resource_group_name
  location             = local.location
  keyvault_name        = local.keyvault_name
  app_managed_identity = data.azuread_service_principal.app_sp.id
  sql_managed_identity = data.azuread_service_principal.sql_server_sp.id
  sql_server_name      = local.sql_server_name
  sql_password         = random_string.random.id
  tags                 = local.tags
}

module "sql_database" {
  source              = "../modules/database"
  sql_server_name     = local.sql_server_name
  sql_database_name   = local.sql_database_name
  resource_group_name = var.resource_group_name
  location            = local.location
  sql_username        = local.sql_username
  sql_password        = random_string.random.id
  tags                = local.tags 
}