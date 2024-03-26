################ Resoruce Group name #############################
name = "3-tier-infra"
################ Region where we can deploy  #####################
location = "Germany West Central"
################ VNET DATA #######################################
vnet_name ="vnet2"
vnetcidr = "10.0.0.0/20"
websubnetcidr = "10.0.1.0/24"
appsubnetcidr = "10.0.2.0/24"
dbsubnetcidr = "10.0.3.0/24"
########### STORAGE BLOB #########################################
storagename = "storageiphone"
containernameblobstorage = "iphonetest"
################### ACI ###########################
container_group_name = "myContGroup"
container_name_aci ="mycont01"
dns_name_label = "aci-label"
os_type =  "Linux"
image_name = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
cpu_core_number = 0.5
memory_size = 1.5
port_number = 80