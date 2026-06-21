terraform {
  required_providers {
      azurerm = {
          source  = "hashicorp/azurerm"
          version = "3.115.0"
      }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "testazterraform"
  location = "spaincentral"
}

resource "azurerm_storage_account" "sa" {
  name                      = "testsaterraform25112024"
  resource_group_name       = resource.azurerm_resource_group.rg.name
  location                  = "spaincentral"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}
