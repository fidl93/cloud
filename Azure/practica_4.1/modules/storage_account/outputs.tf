output "id" {
    description = "The Storage Account ID"
    value = azurerm_storage_account.sa.id
}

output "name" {
    description = "The Storage Account name"
    value = azurerm_storage_account.sa.name
}
