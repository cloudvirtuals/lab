# terraform.tfvars
vnet_name            = "PaaSvnet"
address_space       = ["10.0.0.0/16"]
location            = "East US 2"
resource_group_name = "labvirtual-net-rg"
orgname  = "labvirtual-net-rg"
subnet1_name  = "PaaS-subnet1"
subnet2_name  = "PaaS-subnet2"
subnet1_cidr  = "10.0.1.0/24"
subnet2_cidr  = "10.0.2.0/24"
