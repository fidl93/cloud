variable "name" {
    type = string
    description = "Name of the storage"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "Azure location of storage account environment"
}

variable "address_space" {
    type = list(string)
    description = "Address range of the vnet"
    default = ["10.0.0.0/16"]
}

variable "tags" {
  type = map
  description = "Tags for all the Azure resources"
  default = {
    environment = "Production"
    owner = "francisco dominguez"
  }
}
