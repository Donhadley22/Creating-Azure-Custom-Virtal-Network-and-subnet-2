# Create a resource group
resource "azurerm_resource_group" "Proj-rg" {
  name     = "project1-RG"
  location = "east us"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet1" {
  name                = "project1-network"
  resource_group_name = azurerm_resource_group.Proj-rg.name
  location            = azurerm_resource_group.Proj-rg.location
  address_space       = ["10.0.0.0/16"]
}
# Create a Subnet within the virtual network
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.Proj-rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}