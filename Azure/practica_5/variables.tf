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

variable "tags" {
  type = map
  description = "Tags for all the Azure resources"
  default = {
    environment = "Production"
    owner = "francisco dominguez"
  }
}
