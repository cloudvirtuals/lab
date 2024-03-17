variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure resources."
}

variable "workspace_name" {
  description = "The name of the Azure Databricks workspace."
}

variable "location" {
  description = "The location for the Azure resources."
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

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
}

variable "client_id_secret_name" {
  description = "The name of the secret in Azure Key Vault containing the client ID."
}

variable "client_secret_secret_name" {
  description = "The name of the secret in Azure Key Vault containing the client secret."
}

variable "adls_client_id" {
  description = "The client ID for authenticating with Azure Data Lake Storage."
}

variable "adls_client_secret" {
  description = "The client secret for authenticating with Azure Data Lake Storage."
}

variable "tenant_id" {
  description = "The Azure AD tenant ID."
}

variable "storage_account_name" {
  description = "The name of the Azure Data Lake Storage account."
}
