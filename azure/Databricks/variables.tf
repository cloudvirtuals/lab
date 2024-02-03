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

variable "default_location" {
  default     = "East US 2"
  type = string
}

# Change the default value for a unique name
variable "company" {
  default = "cloudtechstack"
  type = string
}


variable "secretsname" {
    type = map
    default = {
        "databricksappsecret" = "databricksappsecret"
        "databricksappclientid" = "databricksappclientid"
        "tenantid" = "tenantid"
    }
}
