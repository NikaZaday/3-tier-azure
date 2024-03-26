variable "name" {}
variable "vnet_name" {}
variable "location" {}
variable "vnetcidr" {}
variable "websubnetcidr" {}
variable "appsubnetcidr" {}
variable "dbsubnetcidr" {}
variable "storagename" {}
variable "containernameblobstorage" {}
variable "container_name_aci" {}
variable "container_group_name" {
  default       = "myContGroup"
  description   = "The name of the container group"
}

 
 
variable "dns_name_label" {
  description   = "The DNS label/name for the container groups IP"
}

variable "os_type" {
  description   = "The OS for the container group. Allowed values are Linux and Windows"
}

  
variable "image_name" {
  description   = "The container image name"
}

variable "cpu_core_number" {
  default       = "0.5"  
  description   = "The required number of CPU cores of the containers"
}

variable "memory_size" {
  default       = "1.5"  
  description   = "The required memory of the containers in GB"
}

variable "port_number" {
  default       = "80"  
  description   = "A public port for the container"
}