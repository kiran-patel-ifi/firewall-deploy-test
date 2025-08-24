variable "windows_admin_username" {
  description = "Admin username for Windows VMs"
  type        = string
  default     = "azureadmin"
}

variable "windows_admin_password" {
  description = "Admin password for Windows VMs"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "testenv-rg"
}

variable "firewall_vnet_cidr" {
  description = "CIDR block for firewall hub VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "spoke1_vnet_cidr" {
  description = "CIDR block for spoke1 VNet"
  type        = string
  default     = "10.1.0.0/16"
}

variable "spoke2_vnet_cidr" {
  description = "CIDR block for spoke2 VNet"
  type        = string
  default     = "10.2.0.0/16"
}

variable "dc_private_ip" {
  description = "Static private IP for Domain Controller VM"
  type        = string
  default     = "10.1.1.10"
}

variable "client_private_ip" {
  description = "Static private IP for Client VM"
  type        = string
  default     = "10.2.1.10"
}

variable "private_ip_address" {
  type    = string
  default = null
}

variable "subnet_id" {
  description = "Subnet ID where the VM NIC will be placed"
  type        = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}


