locals {
  prefix = "${var.env}-${var.app}-${var.tier}"
}
resource "azurerm_resource_group" "example" {
  name     = "${local.prefix}-${var.rgname}"
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = "${local.prefix}-${var.vnetname}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
   address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "${local.prefix}-${var.subnet1}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "example2" {
  name                 = "${local.prefix}-${var.subnet2}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]

}
resource "azurerm_subnet" "example3" {
  name                 = "${local.prefix}-${var.subnet3}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.3.0/24"]
}
