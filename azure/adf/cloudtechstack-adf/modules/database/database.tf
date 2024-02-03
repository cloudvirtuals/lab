

variable "username" {
  sensitive = true
  type = string
}

variable "password" {
  sensitive = true
  type = string
}

resource "azurerm_sql_server" "cloudtechstack-sqlserver" {
  name                         = "${var.orgname}"
  resource_group_name          = "${var.rgname}"
  location                     = "${var.default_location}"
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
}

resource "azurerm_sql_database" "cloudtechstack-sql-database" {
  name                = "${var.orgname}-sql-database"
  resource_group_name = "${var.rgname}"
  location            = "${var.default_location}"
  server_name         = "azurerm_sql_server.${var.orgname}-sqlserver.name"
}