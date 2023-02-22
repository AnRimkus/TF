resource "azurerm_network_interface" "TfModules" {
  name                = var.NICName
  location            = var.location
  resource_group_name = "${var.base_name}RG"

  ip_configuration {
    name = "test"
    subnet_id = var.SubNetID
    private_ip_address_allocation = "Dynamic"
  }
}