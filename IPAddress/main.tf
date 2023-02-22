resource "azurerm_public_ip" "TfModules" {
  name                = var.IpAddressName
  resource_group_name = "${var.base_name}RG"
  location            = var.location
  allocation_method   = "Dynamic"
}