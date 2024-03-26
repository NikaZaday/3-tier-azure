provider "azurerm" {
  features {}
}

module "resource_group" {
  source         = "./modules/resource_group"
  name           = var.name
  location       = var.location
}

module "vnet" {
  source         = "./modules/vnet"
  vnet_name      = var.vnet_name
  location       = module.resource_group.location_id
  resource_group = module.resource_group.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./modules/network_security_group"
  location       = module.resource_group.location_id
  resource_group = module.resource_group.resource_group_name 
  web_subnet_id  = module.vnet.websubnet_id
  app_subnet_id  = module.vnet.appsubnet_id
  db_subnet_id   = module.vnet.dbsubnet_id
}


# module "storageblob" {
#   source         = "./modules/storage_blob"
#   location       = module.resource_group.location_id
#   resource_group = module.resource_group.resource_group_name 
#   storagename    = var.storagename
#   containername  = var.containernameblobstorage  
# }

# module "aci" {
#   source                = "./modules/container_Instance"
#   resource_group        = module.resource_group.resource_group_name 
#   location              = module.resource_group.location_id
#   container_group_name  = var.container_group_name
#   dns_name_label        = var.dns_name_label
#   os_type               = var.os_type
#   image_name            = var.image_name
#   container_name        = var.container_name_aci
#   cpu_core_number       = var.cpu_core_number
#   memory_size           = var.memory_size
#   port_number           = var.port_number
# }


# Store Tf.state File in Blob Storage 

terraform {
  backend "azurerm" {
    storage_account_name = "terratfstatefile"
    container_name       = "test"
    key                  = "terraform.tfstate" 
    resource_group_name  = "NetworkWatcherRG"
  }
}


