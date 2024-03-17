provider "azurerm" {
  features {}
}

resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
  }
}

data "azurerm_key_vault_secret" "client_id" {
  name         = var.client_id_secret_name
  vault_uri    = azurerm_key_vault.example.vault_uri
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = var.client_secret_secret_name
  vault_uri    = azurerm_key_vault.example.vault_uri
}

output "client_id" {
  value = data.azurerm_key_vault_secret.client_id.value
}

output "client_secret" {
  value = data.azurerm_key_vault_secret.client_secret.value
}
