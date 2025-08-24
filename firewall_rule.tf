resource "azurerm_firewall_network_rule_collection" "domain" {
  name                = "allow-domain-controller-traffic"
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = azurerm_resource_group.main.name
  priority            = 200
  action              = "Allow"

  rule {
    name     = "domain-controller"
    source_addresses = ["*"]
    destination_addresses = ["*"]
    destination_ports     = ["53","88","135","389","445","464","636","3268-3269"]
    protocols             = ["TCP","UDP"]
  }
}
resource "azurerm_firewall_nat_rule_collection" "rdp" {
  name                = "rdp-access"
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = azurerm_resource_group.main.name
  priority            = 100
  action              = "Dnat"
  rule {
    name = "rdp-dc"
    protocols = ["TCP"]
    source_addresses = ["*"]
    destination_addresses = [azurerm_public_ip.firewall.ip_address]
    destination_ports = ["3389"]
    translated_address = azurerm_network_interface.dc.private_ip_address
    translated_port    = "3389"
  }
    # Repeat similarly for the client VM
}
