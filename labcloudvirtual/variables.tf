variable "rgname" {
  default     = "labcloudvirtual-rg"
  type = string
}
variable "vaultrgname" {
  default     = "labcloudvirtual-vault01-rg"
  type = string
}

variable "default_location" {
  default     = "East US 2"
  type = string
}

# Change the default value for a unique name
variable "orgname" {
  default = "labcloudvirtual"
  type = string
}

variable "keyvaultname" {
  default = "labcloudvirtual-vault01"
  type = string
}
variable "sqlservername" {
  default = "labcloudvirtual-sqlserver01"
  type = string
}
variable "sqlusername" {
  default = "sqlusername"
  type = string
}
variable "sqlpasswd" {
  default = "sqlpasswd"
  type = string
}
variable "sqldbname" {
  default = "labcloudvirtual-sqldb01"
  type = string
}
variable "env" {
  type    = string
  default = "dev"
}

variable "dbwscope" {
  type    = string
  default = "azkvdbwscope"
}

variable "stgaccname" {
  type    = string
  default = "stg"
}

variable "secretsname" {
    type = map
    default = {
        "databricksappsecret" = "databricksappsecret"
        "databricksappclientid" = "databricksappclientid"
        "tenantid" = "tenantid"
    }
}
variable "adfstgname" {
  sensitive = true
  type = string
  default = "labcloudvirtualadfstg01"
}
variable "adfstgcont01" {
  sensitive = true
  type = string
  default = "labcloudvirtual-adfstgc01"
}

variable "adbstgaccname" {   
    sensitive = true
    type = string
    default = "labcloudvirtualadbstg01"
}

variable "adbstgcbronze" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbstgcbronze"
}
variable "adbstgcsilver" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbstgcsilver"
}
variable "adbstgcgold" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbstgcgold"
}
variable "adbappsecret" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbappsecret"
}
variable "adbappclientid" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbappclientid"
}
variable "adbapptenantid" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbapptenantid"
}
variable "adbclustername" {   
    sensitive = true
    type = string
    default = "labcloudvirtual-adbcluster"
}
variable "noworkers" {   
    sensitive = true
    type = string
    default = 1
}
