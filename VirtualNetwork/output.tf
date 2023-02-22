output "SubNetId_out" {
  value = (azurerm_virtual_network.TfModules.subnet)[*].id
}
output "SubNetName_out" {
  value = (azurerm_virtual_network.TfModules.subnet)[*].name
}
output "VNet_out" {
  value = azurerm_virtual_network.TfModules.name
}