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
  location = "westeurope"
}

resource "azurerm_storage_account" "sa" {
  name                      = "testsaterraform25112024"
  resource_group_name       = resource.azurerm_resource_group.rg.name
  location                  = "westeurope"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "testaz_nsg"
  location            = "westeurope"
  resource_group_name = resource.azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "testaz_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westeurope"
  resource_group_name = resource.azurerm_resource_group.rg.name

  subnet {
    name             = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name             = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group   = resource.azurerm_network_security_group.nsg.id
  }


  tags = {
    environment = "Production"
    owner = "francisco dominguez"
  }
}
