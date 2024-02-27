# main.tf

provider "azurerm" {
  features = {}
}

module "vnet" {
  source = "github.com/cloudvirtuals/coremodules/modules/network"

  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  orgname = var.orgname
  subnet1_name = var.subnet1_name
  subnet2_name  = var.subnet2_name
  subnet1_cidr  = var.subnet1_cidr
  subnet2_cidr  = var.subnet2_cidr
}

