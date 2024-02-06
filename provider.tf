provider "azurerm" {
    subscription_id = "809eff35-137f-4411-9bef-83c5a1552808"
    tenant_id = "f4425336-4592-4d59-8bf1-b90a45179899"
    client_id = "d561c259-1acc-4a90-850c-b463d0aeedbf"
    client_secret = "3U68Q~N0SpEanCOQ-4rUjNNO614OIrYm5IxZhaDu"
    features {}
}

resource "azurerm_resource_group" "myrg" {
  name = "today-rg"
  location = "east us"
}