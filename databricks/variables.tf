variable "env" {
  type    = string
  default = "prod"
}

variable "dbwscope" {
  type    = string
  default = "azkvdbwscope"
}

variable "stgaccname" {
  type    = string
  default = "stacdata"
}

variable "default_location" {
  default     = "East US 2"
  type = string
}

# Change the default value for a unique name
variable "company" {
  default = "cloudstack"
  type = string
}


variable "secretsname" {
    type = map
    default = {
        "databricksappsecret" = "cloudtechstack-adbappsecret"
        "databricksappclientid" = "cloudtechstack-adbappclientid"
        "tenantid" = "cloudtechstack-adbapptenantid"
    }
}