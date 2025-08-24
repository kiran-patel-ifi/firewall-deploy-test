resource "azurerm_firewall_network_rule_collection" "domain_controller" {
  name                = "allow-domain-controller-traffic"
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = azurerm_resource_group.main.name
  priority            = 200
  action              = "Allow"

  rule {
    name                  = "dc-ports"
    source_addresses      = ["*"]
    destination_addresses = ["*"]
    destination_ports     = ["53", "88", "135", "389", "445", "464", "636", "3268", "3269"]
    protocols             = ["TCP", "UDP"]
  }
}

resource "azurerm_firewall_nat_rule_collection" "rdp_rules" {
  name                = "rdp-access"
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = azurerm_resource_group.main.name
  priority            = 100
  action              = "Dnat"

  rule {
    name                 = "rdp-dc"
    protocols            = ["TCP"]
    source_addresses     = ["*"]
    destination_addresses = [azurerm_public_ip.firewall_pip.ip_address]
    destination_ports    = ["3389"]
    translated_address   = module.windows_vm_dc.private_ip_address
    translated_port      = "3389"
  }

  rule {
    name                 = "rdp-client"
    protocols            = ["TCP"]
    source_addresses     = ["*"]
    destination_addresses = [azurerm_public_ip.firewall_pip.ip_address]
    destination_ports    = ["3390"]
    translated_address = module.windows_vm_client.private_ip_address
    translated_port      = "3389"
  }
}
