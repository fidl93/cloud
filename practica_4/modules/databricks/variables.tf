variable "name" {
type            = string
    description = "Name of the storage"
}

variable "resource_group_name" {
    type        = string
    description = "Name of the resource group"
}

variable "location" {
    type        = string
    description = "Azure location of storage account environment"
}


variable "tags" {
    type        = map
    description = "Tags for all the Azure resources"
}
