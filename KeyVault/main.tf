resource "azurerm_key_vault" "TfModules" {
  name                        = var.KeyVaultName
  location                    = var.location
  resource_group_name         = "${var.base_name}RG"
  #enabled_for_disk_encryption = true
  tenant_id                   = "3bd98257-a981-43ea-8dbe-e4c197b99992"
  #soft_delete_retention_days  = 7
  #purge_protection_enabled    = false

  sku_name = "standard"
/*
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }

*/

}