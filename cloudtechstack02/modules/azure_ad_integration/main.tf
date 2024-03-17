resource "azurerm_databricks_workspace" "ad_integration" {
  workspace_id         = var.databricks_workspace_id
  resource_group_name  = var.resource_group_name
  managed_resource_id  = var.databricks_workspace_id
  directory_id         = var.tenant_id
}

output "databricks_workspace_ad_integration_id" {
  value = azurerm_databricks_workspace.ad_integration.id
}
