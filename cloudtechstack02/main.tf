provider "azurerm" {
  features {}
}

data "azurerm_subnet" "existing" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group
}

module "databricks_workspace" {
  source                        = "./modules/databricks_workspace"
  resource_group_name           = var.resource_group_name
  workspace_name                = var.workspace_name
  location                      = var.location
  subnet_name                   = var.subnet_name
  virtual_network_name          = var.virtual_network_name
  virtual_network_resource_group = var.virtual_network_resource_group
  scope_name                    = var.scope_name
  storage_account_id            = module.adls_storage.storage_account_id
  adls_client_id                = data.azurerm_key_vault_secret.adls_client_id.value
  adls_client_secret            = data.azurerm_key_vault_secret.adls_client_secret.value
  tenant_id                     = var.tenant_id
}


module "adls_storage" {
  source              = "./modules/adls_storage"
  resource_group_name = var.resource_group_name
  storage_account_name = var.storage_account_name
  location            = var.location
}


module "azure_ad_integration" {
  source           = "./modules/azure_ad_integration"
  resource_group_name = var.resource_group_name
  databricks_workspace_id = module.databricks_workspace.databricks_workspace_id
  tenant_id = var.tenant_id
}

module "azure_key_vault" {
  source             = "./modules/azure_key_vault"
  resource_group_name = var.resource_group_name
  key_vault_name      = var.key_vault_name
  location            = var.location
  client_id_secret_name = var.client_id_secret_name
  client_secret_secret_name = var.client_secret_secret_name
}


# Define variables here

