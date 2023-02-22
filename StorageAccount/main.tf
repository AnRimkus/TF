resource "azurerm_storage_account" "example" {
  name                     = var.StorageName
  resource_group_name      = "${var.base_name}RG"
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}