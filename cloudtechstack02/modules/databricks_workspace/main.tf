provider "azurerm" {
  features {}
}

data "azurerm_subnet" "existing" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group
}

resource "azurerm_databricks_workspace" "example" {
  name                    = var.workspace_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  sku                     = "premium"
  friendly_name           = "My Databricks Workspace"
  vnet_subnet_id          = data.azurerm_subnet.existing.id
  tags = {
    Environment = "Production"
  }
}

resource "azurerm_databricks_secret_scope" "example" {
  name                        = var.scope_name
  resource_group_name         = var.resource_group_name
  workspace_name              = azurerm_databricks_workspace.example.name
  scope_backend_type          = "DATABRICKS"
  managed_resource_group_name = azurerm_databricks_workspace.example.managed_resource_group_name
}

resource "azurerm_databricks_cluster" "dbcluster01" {
  resource_group_name     = var.resource_group_name
  workspace_name          = azurerm_databricks_workspace.example.name
  cluster_name            = "dbcluster01"
  spark_version           = "7.3.x-scala2.12"
  node_type_id            = "Standard_D3_v2"
  num_workers             = 2

  spark_conf {
    "spark.hadoop.dfs.adls.oauth2.access.token.provider.type" = "ClientCredential"
    "spark.hadoop.dfs.adls.oauth2.client.id"                  = var.adls_client_id
    "spark.hadoop.dfs.adls.oauth2.client.secret"              = var.adls_client_secret
    "spark.hadoop.dfs.adls.oauth2.refresh.url"                = "https://login.microsoftonline.com/${var.tenant_id}/oauth2/token"
  }
}

output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.example.id
}
