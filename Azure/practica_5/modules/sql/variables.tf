variable "name" {
    type        = string
    description = "Name of the storage"
}

variable "resource_group_name" {
    type         = string
    description = "Name of the resource group"
}

variable "location" {
    type        = string
    description = "Azure location of storage account environment"
    default = "northeurope"
}

variable "admin_login" {
    type = string
    description = "Admin username to login"
    default = "adminsql"
}

variable "admin_pass" {
    type        = string
    description = "Pass for admin user"
    default     = "Pa55w.rd1234"
    sensitive   = true
}
