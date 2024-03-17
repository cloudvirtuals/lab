output "databricks_workspace_id" {
  value = module.databricks_workspace.databricks_workspace_id
}

output "key_vault_id" {
  value = module.azure_key_vault.key_vault_id
}

output "adls_storage_account_id" {
  value = module.adls_storage.storage_account_id
}
