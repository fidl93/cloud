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
    name                = "${var.label}sqldb123543"
    resource_group_name = module.resource_group.name
}

module "network_security_group" {
    source              = "./modules/network_security_group"
    name                = "${var.label}nsg"
    resource_group_name = module.resource_group.name
    location            = var.location
    tags                = var.tags
}

module "virtual_network" {
    source              = "./modules/virtual_network"
    name                = "${var.label}vnet"
    resource_group_name = module.resource_group.name
    location            = var.location
    tags                = var.tags
}

module "subnet" {
    source = "./modules/subnets"
    name = "${var.label}_subnet"
    resource_group_name = module.resource_group.name
    address_prefixes = var.subnet_prefix
    virtual_network_name = module.virtual_network.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
  subnet_id = module.subnet.id
  network_security_group_id = module.network_security_group.id
}

resource "azurerm_network_security_rule" "ingress_rule" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.resource_group.name
  network_security_group_name = module.network_security_group.name

}

module "virtual_machine" {
    source              = "./modules/virtual_machine"
    resource_group_name = module.resource_group.name
    location            = var.location
    subnet_id           = module.subnet.id
    vm_name             = "${var.label}vm"
    admin_password      = var.vm_password
    tags                = var.tags
}
