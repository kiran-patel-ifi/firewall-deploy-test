resource "azurerm_virtual_network_peering" "firewall_spoke1" {
  name                      = "firewall-to-spoke1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.firewall_vnet_name
  remote_virtual_network_id = var.spoke1_vnet_id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "spoke1_firewall" {
  name                      = "spoke1-to-firewall"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spoke1_vnet_name
  remote_virtual_network_id = var.firewall_vnet_id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "firewall_spoke2" {
  name                      = "firewall-to-spoke2"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.firewall_vnet_name
  remote_virtual_network_id = var.spoke2_vnet_id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "spoke2_firewall" {
  name                      = "spoke2-to-firewall"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spoke2_vnet_name
  remote_virtual_network_id = var.firewall_vnet_id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  allow_virtual_network_access = true
}
