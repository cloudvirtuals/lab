variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Databricks workspace."
}

variable "workspace_name" {
  description = "The name of the Azure Databricks workspace."
}

variable "location" {
  description = "The location of the Azure Databricks workspace."
}

variable "subnet_name" {
  description = "The name of the existing subnet to use for the Azure Databricks workspace."
}

variable "virtual_network_name" {
  description = "The name of the virtual network containing the existing subnet."
}

variable "virtual_network_resource_group" {
  description = "The resource group name of the virtual network containing the existing subnet."
}

variable "scope_name" {
  description = "The name of the Databricks workspace scope."
}
