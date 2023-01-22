resource "azurerm_service_plan" "app_service_plan" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.app_service_plan_name
  os_type             = var.app_service_plan_os
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_windows_web_app" "app_service" {
  count               = var.app_service_plan_os == "Windows" ? 1 : 0
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  tags                = var.tags
  site_config {}
  identity {
    type = "SystemAssigned"
  }
}