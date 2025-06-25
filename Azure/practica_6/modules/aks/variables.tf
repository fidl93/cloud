variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created."
  type        = string
}

variable "aks_name" {
  description = "The name of the Azure Kubernetes Service cluster."
  type        = string
  default     = "testingaks"
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "West Europe"
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
