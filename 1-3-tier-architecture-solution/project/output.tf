output "azurerm_service_plan_name" {
  value = module.app_service.azurerm_service_plan_name
}
output "azurerm_service_name" {
  value = module.app_service.app_service_name
}
output "kayvault_name" {
  value = module.secret_management.keyvault_name
}