resource "azurerm_storage_account" "storage_blob" {
  name                     = var.storagename
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_blob" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.storage_blob.name
  container_access_type = "private"
}
