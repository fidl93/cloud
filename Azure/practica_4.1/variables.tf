variable "label" {
    type = string
    description = "General label for all components"
    default = "testaz2611242"
}

variable "location" {
    type = string
    description = "Azure location for resources"
    default = "westeurope"
}

variable "subnet_prefix" {
    type = list(string)
    description = "Ip prefix for subnet"
    default = ["10.0.1.0/24"]
}

variable "vm_password" {
  type        = string
  description = "Password for the virtual machine administrator"
  sensitive   = true
  default     = "Pa55w.rd1234!"
}

variable "tags" {
  type = map
  description = "Tags for all the Azure resources"
  default = {
    environment = "Production"
    owner = "francisco dominguez"
  }
}
