resource "azurerm_key_vault" "vault" {
  name = "vault1216516"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id = data.azurerm_client_config.current.tenant_id

  enable_rbac_authorization = true
  sku_name = "standard"
}