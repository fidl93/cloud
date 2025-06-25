resource "azurerm_databricks_workspace" "databrisk_workspace" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "trial"
  tags                = var.tags
}
