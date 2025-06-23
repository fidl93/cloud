variable "name" {
    type        = string
    description = "Name of resource group"
}

variable "location" {
    type = string
    description = "Azure location of resource group"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "tags" {
    type        = map(string)
    description = "Tags to apply to the resources"
    default     = {}

}
