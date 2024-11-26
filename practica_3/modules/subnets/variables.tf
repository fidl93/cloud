variable "name" {
    type = string
    description = "Name of the storage"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "virtual_network_name" {
    type = string
    description = "The name of the virtual network to link"
}

variable "address_prefixes" {
    type = list(string)
    description = "Ip Prefix for subnet"
}
