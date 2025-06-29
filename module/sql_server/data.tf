data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.kvrg_name

}
data "azurerm_key_vault_secret" "username" {
  name         = var.sqlserverusername
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = var.sqlserverpassword
  key_vault_id = data.azurerm_key_vault.kv.id
}