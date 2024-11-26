variable "label" {
    type = string
    description = "General label for all components"
    default = "testaz261124"
}

variable "location" {
    type = string
    description = "Azure location for resources"
    default = "westeurope"
}

variable subnet1_prefix {
    type = list(string)
    description = "Ip prefix for subnet"
    default = ["10.0.1.0/24"]
}

variable subnet2_prefix {
    type = list(string)
    description = "Ip prefix for subnet"
    default = ["10.0.2.0/24"]
}
