resource "azurerm_network_security_group" "TfModules" {
    name = var.NSGName
    location = var.location
    resource_group_name = "${var.base_name}RG"
}