data "azurerm_key_vault" "myTFstateRG" {
  name                = "tf-keyvault-20230220"
  resource_group_name = "myTFstateRG"
}

data "azurerm_key_vault_secret" "vmpassword" {
  name         = "tf-vm-secret"
  key_vault_id = data.azurerm_key_vault.myTFstateRG.id
  depends_on = [ data.azurerm_key_vault.myTFstateRG ]
}

resource "azurerm_windows_virtual_machine" "TfModules" {
  name                = "tf-machine"
  resource_group_name = "${var.base_name}RG"
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  #admin_password      = "testP_13swrd"
  admin_password      = data.azurerm_key_vault_secret.vmpassword.value
  network_interface_ids = [
    var.NICId,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}