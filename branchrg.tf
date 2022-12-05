terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test1" {
  name     = lookup(var.worspacergname, terraform.workspace)
  location = "West Europe"
}

variable "worspacergname" {
  type = map
  default = {
    default = "testdrg1"
    prod    = "testprg1"
    dev     = "testdevrg1"
  }
}
