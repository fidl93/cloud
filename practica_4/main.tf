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

module "resource_group" {
    source   = "./modules/resource_group"
    name     = "${var.label}_rg"
    location = var.location
}

module "storage_account" {
    source              = "./modules/storage_account"
    name                = "${var.label}sa"
    location            = var.location
    resource_group_name = module.resource_group.name
}

module "mysql" {
    source              = "./modules/sql"
    name                = "${var.label}sqldb"
    resource_group_name = module.resource_group.name
}

module "databricks_workspace" {
    source              = "./modules/databricks"
    name                = "${var.label}dbw"
    location            = var.location
    resource_group_name = module.resource_group.name
    tags                = var.tags

}
