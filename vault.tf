resource "azurerm_key_vault" "myvault" {
  name                = "my-vault-750098"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = "f4425336-4592-4d59-8bf1-b90a45179899"
  sku_name = "standard"

  access_policy {
    tenant_id = "f4425336-4592-4d59-8bf1-b90a45179899"
    object_id = "c6c9409d-ad1e-4b00-81c8-552766a535ad"
    key_permissions = [
      "Get",
      "Create",
      "Delete",
      "List",
    ]
    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List",
    ]
  }
}