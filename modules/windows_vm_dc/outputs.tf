output "public_ip_address" {
  value = azurerm_public_ip.vm_pip[0].ip_address
}

output "private_ip_address" {
  value = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
