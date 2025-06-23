resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.admin_login
  administrator_password = var.admin_pass
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
  zone                   = 1
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = "eoi"
  resource_group_name = var.resource_group_name
  server_name         = resource.azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "rule" {
  name                = "office"
  resource_group_name = var.resource_group_name
  server_name         = resource.azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
