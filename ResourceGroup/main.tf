resource "azurerm_resource_group" "TfModules" {
  name     = "${var.base_name}RG"
  location = var.location
}