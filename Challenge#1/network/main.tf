resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "be-subnet" {
  name                 = "be-subnet"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.besubnet_cidr]
}

resource "azurerm_subnet" "fe-subnet" {
  name                 = "fe-subnet"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.fesubnet_cidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnet_cidr]
}
