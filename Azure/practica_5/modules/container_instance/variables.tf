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

variable "restart_policy" {
    type        = string
    description = "Restart policy to container"
    default = "Always"
}

variable "image" {
    type = string
    description = "Image to load"
    default = "testcr23062025.azurecr.io/api_python:1.0.0"
}

variable "registry_pass" {
    type = string
    description = "Pass to auth against registry"
    default = "XXXXXXXXXXXXXX"
}
