output azurerm_service_plan_name {
  value       = azurerm_service_plan.app_service_plan.name
}

output app_service_name {
  value       = azurerm_windows_web_app.app_service[0].name
}