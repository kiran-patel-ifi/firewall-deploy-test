resource "azurerm_virtual_network_peering" "firewall_spoke1" {
  name                      = "firewall-to-spoke1"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.firewall.name
  remote_virtual_network_id = azurerm_virtual_network.spoke1.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
}
resource "azurerm_virtual_network_peering" "spoke1_firewall" {
  name                      = "spoke1-to-firewall"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.spoke1.name
  remote_virtual_network_id = azurerm_virtual_network.firewall.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
}

resource "azurerm_virtual_network_peering" "firewall_spoke2" {
  name                      = "firewall-to-spoke2"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.firewall.name
  remote_virtual_network_id = azurerm_virtual_network.spoke2.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
}
resource "azurerm_virtual_network_peering" "spoke2_firewall" {
  name                      = "spoke2-to-firewall"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.spoke2.name
  remote_virtual_network_id = azurerm_virtual_network.firewall.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
}
