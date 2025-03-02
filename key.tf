resource "azurerm_key_vault_key" "rsa_key" {
  name         = "rsa-key"
  key_vault_id = azurerm_key_vault.vault.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["sign", "verify", "wrapKey", "unwrapKey"]
}