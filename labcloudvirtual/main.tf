# Create main resource group
resource "azurerm_resource_group" "labcloudvirtual-rg" {
  name     = "${var.rgname}-rg"
  location = "${var.default_location}"
}

#data "azurerm_key_vault" "labcloudvirtual-vault01" {
#  resource_group_name = var.vaultrgname
#  name = var.keyvaultname
#}

#data "azurerm_key_vault_secret" "sql-server-username" {
#  name = var.sqlusername
#  key_vault_id = data.azurerm_key_vault.labcloudvirtual-vault01.id
#}

#data "azurerm_key_vault_secret" "sql-server-password" {
#  name = var.sqlpasswd
#  key_vault_id = data.azurerm_key_vault.labcloudvirtual-vault01.id
#}

module "labcloudvirtual-adb" {
  source = "github.com/cloudvirtuals/coremodules/modules/adb"
  rgname = var.rgname
  location = var.default_location
  orgname = var.orgname
  adbstgaccname = var.adbstgaccname
  default_location = var.default_location
  secretsname = var.secretsname
  dbwscope = var.dbwscope
  env = var.env
}

module "blob-storage" {
  source = "github.com/cloudvirtuals/coremodules/modules/blob-storage"
  rgname = var.rgname
  location = var.default_location
  orgname = var.orgname
  adfstgname = var.adfstgname
  adfstgcont01 = var.adfstgcont01

}

#module "sql-database" {
#  source = "github.com/cloudvirtuals/coremodules/modules/database"
#
#  location = var.default_location
#  rgname = var.rgname
#  sqlservername = var.sqlservername
#  sqldbname = var.sqldbname
#  sqlusername = data.azurerm_key_vault_secret.sql-server-username.value
#  sqlpasswd = data.azurerm_key_vault_secret.sql-server-password.value
#
#
#}

resource "azurerm_data_factory" "labcloudvirtual-datafactory" {
  name                = var.orgname
  location            = var.default_location
  resource_group_name = var.rgname
 
  github_configuration {
    account_name = "cloudvirtuals"
    branch_name = "main"
    git_url = "https://github.com/cloudvirtuals"
    repository_name = "lambdatest"
    root_folder = "/"
  }

  tags = {
        creator = "Terraform"
        project = var.orgname
  }
}

