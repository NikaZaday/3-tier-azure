resource "azurerm_container_group" "container" {
  name                = var.container_group_name
  location            = var.location
  resource_group_name = var.resource_group
  ip_address_type     = "Public"
  os_type             = var.os_type
  restart_policy      = "Always"

  container {
    name   = var.container_name
    image  = var.image_name
    cpu    = var.cpu_core_number
    memory = var.memory_size 

    ports {
      port     = var.port_number
      protocol = "TCP"
    }
  }
}