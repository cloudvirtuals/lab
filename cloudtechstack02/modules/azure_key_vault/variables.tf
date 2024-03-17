variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Key Vault."
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
}

variable "location" {
  description = "The location for the Azure Key Vault."
}

variable "client_id_secret_name" {
  description = "The name of the secret in Azure Key Vault containing the client ID."
}

variable "client_secret_secret_name" {
  description = "The name of the secret in Azure Key Vault containing the client secret."
}
