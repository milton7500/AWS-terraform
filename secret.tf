resource "azurerm_key_vault_secret" "mysecret" {
  name         = "mysecret7500"
  value        = "kingindia7500"
  key_vault_id = azurerm_key_vault.myvault.id
}