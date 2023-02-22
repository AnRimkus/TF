resource "azurerm_virtual_network" "TfModules" {
    name = var.VNet
    resource_group_name = "${var.base_name}RG"
    location = var.location
    address_space = [var.AdressFix]

    subnet {
        name = var.SubNet
        address_prefix = var.SubnetPrefix
    }
}