# variables.tf

variable "vnet_name" {
  description = "Name of the Azure VNet"
}

variable "address_space" {
  description = "Address space for the Azure VNet"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
}
variable "orgname" {
  description = "Name of the Azure resource group"
}
variable "subnet1_cidr" {
  description = "Name of the Azure resource group"
}
variable "subnet1_name" {
  description = "Name of the Azure resource group"
}
variable "subnet2_name" {
  description = "Name of the Azure resource group"
}
variable "subnet2_cidr" {
  description = "Name of the Azure resource group"
}
