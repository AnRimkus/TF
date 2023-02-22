/*
data "azurerm_storage_account" "example" {
  name                = "tfstorage20230218"
  resource_group_name = "${var.base_name}RG"
}
*/
data "azurerm_key_vault" "example" {
  name                = "tf-keyvault-20230220"
  resource_group_name = "myTFstateRG"
}

resource "azurerm_storage_account" "example" {
  name                     = var.StorageName
  resource_group_name      = "${var.base_name}RG"
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_monitor_diagnostic_setting" "TfModules" {
  name               = "tf_DiagnosticSettings"
  target_resource_id = data.azurerm_key_vault.example.id
  storage_account_id = azurerm_storage_account.example.id
    enabled_log {
    category = "AuditEvent"

    retention_policy {
        enabled = false
        }
    }

    metric {
        category = "AllMetrics"

        retention_policy {
        enabled = false
        }
    }
}