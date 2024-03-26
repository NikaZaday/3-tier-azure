resource "azurerm_virtual_network" "vnet01" {
  name                = var.vnet_name
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}
################################# PUBLIC SUBNET ###########################################

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.websubnetcidr]
  
}
############################## NAT GATEWAY ################################################
resource "azurerm_nat_gateway" "web-nat-gatway" {
  name                = "Web-NatGateway"
  location            = var.location
  resource_group_name = var.resource_group
  sku_name            = "Standard"
}

resource "azurerm_subnet_nat_gateway_association" "web_association" {
  subnet_id      = azurerm_subnet.web-subnet.id
  nat_gateway_id = azurerm_nat_gateway.web-nat-gatway.id
}

################################# PRIVATE SUBNET ###########################################
resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnetcidr]
  private_endpoint_network_policies_enabled =true
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
  private_endpoint_network_policies_enabled =true
}
