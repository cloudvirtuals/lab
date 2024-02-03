variable "rgname" {
  default     = "cloudtechstack-rg"
  type = string
}

variable "default_location" {
  default     = "East US 2"
  type = string
}

# Change the default value for a unique name
variable "orgname" {
  default = "cloudtechstack"
  type = string
}

variable "keyvaultname" {
  default = "cloudtechstack-vault"
  type = string
}
}
