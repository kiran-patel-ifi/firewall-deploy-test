resource "azurerm_virtual_network" "firewall" {
  name                = "vnet-firewall"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.firewall.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "spoke1" {
  name                = "vnet-spoke1"
  address_space       = ["10.1.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "spoke1_subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke1.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_virtual_network" "spoke2" {
  name                = "vnet-spoke2"
  address_space       = ["10.2.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "spoke2_subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke2.name
  address_prefixes     = ["10.2.1.0/24"]
}

output "firewall_subnet_id" {
  value = azurerm_subnet.firewall_subnet.id
}

output "spoke1_subnet_id" {
  value = azurerm_subnet.spoke1_subnet.id
}

output "spoke2_subnet_id" {
  value = azurerm_subnet.spoke2_subnet.id
}
