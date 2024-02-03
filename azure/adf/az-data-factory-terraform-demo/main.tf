terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.0"
    }
  }

  backend "azurerm" {
        resource_group_name  = "terraform-backend"
        storage_account_name = "cloudtechstackstgbackend"
        container_name       = "terraformbackend"
        key                  = "cloudtechstack.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_key_vault" "cloudtechstack-vault" {
  resource_group_name = ${var.rgname}
  name = ${var.keyvaultname}
}

data "azurerm_key_vault_secret" "sql-username" {
  name = "sql-server-username"
  key_vault_id = data.azurerm_key_vault.${var.keyvaultname}.id
}

data "azurerm_key_vault_secret" "sql-password" {
  name = "sql-server-password"
  key_vault_id = data.azurerm_key_vault.cloudtechstack-vault.id
}

module "blob-storage" {
  source = "./modules/blob-storage"

  resource_group_name = ${var.rgname}
  location = ${var.default_location}
}

module "sql-database" {
  source = "./modules/database"

 resource_group_name = ${var.rgname}
  location = ${var.default_location}
  username = data.azurerm_key_vault_secret.sql-server-username.value
  password = data.azurerm_key_vault_secret.sql-server-password.value
}

resource "azurerm_data_factory" "cloudtechstack-datafactory" {
  name                = ${var.orgname}
  location            = ${var.default_location}
  resource_group_name = ${var.rgname}
  github_configuration {
    account_name = "cloudvirtuals"
    branch_name = "main"
    git_url = "https://github.com/cloudvirtuals"
    repository_name = "lambdatest"
    root_folder = "/"
  }

  tags = {
        creator = "Terraform"
        project = "cloudtechstack"
  }
}