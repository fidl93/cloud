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

module "network_security_group" {
    source = "./modules/network_security_group"
    name                = "${var.label}_nsg"
    location            = var.location
    resource_group_name = module.resource_group.name
}

module "virtual_network" {
    source              = "./modules/virtual_network"
    name                = "${var.label}_vnet"
    location            = var.location
    resource_group_name = module.resource_group.name
}

module "subnet1" {
    source = "./modules/subnets"
    name = "${var.label}_subnet1"
    resource_group_name = module.resource_group.name
    address_prefixes = var.subnet1_prefix
    virtual_network_name = module.virtual_network.name
}

module "subnet2" {
    source = "./modules/subnets"
    name = "${var.label}_subnet2"
    resource_group_name = module.resource_group.name
    address_prefixes = var.subnet2_prefix
    virtual_network_name = module.virtual_network.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
  subnet_id = module.subnet1.id
  network_security_group_id = module.network_security_group.id
}
