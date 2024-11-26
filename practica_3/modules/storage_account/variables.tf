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

variable "account_tier" {
    type = string
    description = "Tier of the Storage"
    default     = "Standard"
}

variable "account_replication_type" {
    type = string
    description = "Azure replication"
    default     = "LRS"
}
