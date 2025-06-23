variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "Azure location environment"
}

variable subnet_id {
    type = string
    description = "ID of the subnet where the virtual machine will be deployed"
}

variable "vm_name" {
    type = string
    description = "Name of the virtual machine"

}

variable vm_size {
    type = string
    default = "Standard_B1s"
    #default = "Standard_F1s"
    description = "Size of the virtual machine"
}

variable "admin_password" {
    type = string
    description = "Password for the virtual machine administrator"
    sensitive = true
    default = "Pa55w.rd1234!"
}

variable "tags" {
    type = map(string)
    description = "Tags to apply to the resources"
    default = {}

}
