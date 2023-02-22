output "StorageURI_out" {
  value       = azurerm_storage_account.example.primary_blob_endpoint
  description = "Return the primary endpoint of the Blob Storage"
  depends_on  = [azurerm_storage_account.example]
}
