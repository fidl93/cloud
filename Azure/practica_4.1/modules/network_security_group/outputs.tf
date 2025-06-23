output "id" {
    description = "The NSG ID"
    value = azurerm_network_security_group.nsg.id
}

output "name" {
    description = "The NSG name"
    value = azurerm_network_security_group.nsg.name
}
