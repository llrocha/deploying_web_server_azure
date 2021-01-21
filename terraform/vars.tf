variable "prefix" {
  description = "The prefix should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in wich all resources in this example should be created."
  default = "East US"
}

variable "admin_user" {
  description = "The Azure user administrator."
  default = "nunix"
}

variable "password" {
  description = "The Azure Region in wich all resources in this example should be created."
  default = "East@US00"
}

variable "env" {
  description = "Environment main|release|develop where main is production, release is non-prod and develop is development environment"
  default = "main"
}
