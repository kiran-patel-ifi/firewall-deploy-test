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
variable "resource_group_name"    { default = "testenv-rg" }
variable "location"               { default = "Central India" }
variable "firewall_vnet_cidr"     { default = "10.0.0.0/16" }
variable "spoke1_vnet_cidr"       { default = "10.1.0.0/16" }
variable "spoke2_vnet_cidr"       { default = "10.2.0.0/16" }


variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "client_private_ip" {
  type = number
}

variable "dc_private_ip" {
  type = number
}