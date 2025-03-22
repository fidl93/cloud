resource "azurerm_container_group" "container" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy

  image_registry_credential {
    username = "testing-git"
    password = var.registry_pass
    server = "fidltest2811.azurecr.io"
  }

  container {
    name   = "testingapi"
    image  = var.image
    cpu    = 1
    memory = 2

    ports {
      port     = 5000
      protocol = "TCP"
    }
  }
}
