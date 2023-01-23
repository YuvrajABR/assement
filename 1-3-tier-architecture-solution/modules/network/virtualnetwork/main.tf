resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_vnet_space
}

resource "azurerm_subnet" "subnet" {
  name                 = join("-", ["appgw", "subnet"])
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.location
  address_prefixes     = var.address_subnet_space
}
