terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.43.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.9.1"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.6.2"
    }
}

  backend "azurerm" {
        resource_group_name  = "labcloudvirtualrg"
        storage_account_name = "labcloudvirtualstg"
        container_name       = "terraformbackend"
        key                  = "labcloudvirtual.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azuread" {
  # Configuration options
}

provider "time" {
  # Configuration options
}



