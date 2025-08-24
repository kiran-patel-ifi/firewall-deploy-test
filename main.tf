provider "azurerm" {
  features {}
}

module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "firewall" {
  source              = "./modules/firewall"
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_subnet_id  = module.vnet.firewall_subnet_id
}

module "peering" {
  source              = "./modules/peering"
  resource_group_name = var.resource_group_name
  firewall_vnet_name  = module.vnet.firewall_vnet_name
  firewall_vnet_id    = module.vnet.firewall_vnet_id
  spoke1_vnet_name    = module.vnet.spoke1_vnet_name
  spoke1_vnet_id      = module.vnet.spoke1_vnet_id  
  spoke2_vnet_name    = module.vnet.spoke2_vnet_name
  spoke2_vnet_id      = module.vnet.spoke2_vnet_id
}
module "windows_vm_dc" {
  source              = "./modules/windows_vm"
  vm_name             = "win-dc"
  subnet_id           = module.vnet.spoke1_subnet_id
  public_ip           = true
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  private_ip_address  = var.dc_private_ip
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "windows_vm_client" {
  source              = "./modules/windows_vm"
  vm_name             = "win-client"
  subnet_id           = module.vnet.spoke2_subnet_id
  public_ip           = true
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  private_ip_address  = var.client_private_ip
  location            = var.location
  resource_group_name = var.resource_group_name
}
