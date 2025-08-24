output "firewall_public_ip" {
  value = module.firewall.public_ip_address
}

output "dc_vm_public_ip" {
  value = module.windows_vm_dc.public_ip_address
}

output "client_vm_public_ip" {
  value = module.windows_vm_client.public_ip_address
}
