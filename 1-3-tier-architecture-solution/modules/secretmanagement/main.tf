data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  tags                        = var.tags
  sku_name                    = "standard"

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    secret_permissions = ["Get", "Set", "List", ]
  }

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = var.app_managed_identity
    secret_permissions = ["Get", "Set", "List", ]
  }
  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = var.sql_managed_identity
    secret_permissions = ["Get", "Set", "List", ]
  }
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = join("-", [var.sql_server_name, "password"])
  value        = var.sql_password
  key_vault_id = azurerm_key_vault.keyvault.id
}