data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each            = var.key_vaults
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = each.value.sku_name
}
