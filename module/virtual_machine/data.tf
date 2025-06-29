data "azurerm_public_ip" "datapip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
}
data "azurerm_subnet" "datasubnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name  
  resource_group_name  = var.rg_name
}

data "azurerm_key_vault" "datakv" {
  name                = var.key_vault_name
  resource_group_name = var.kvrg_name
}
data "azurerm_key_vault_secret" "kv_secret_username" {
  name         = var.vmusername
  key_vault_id = data.azurerm_key_vault.datakv.id
}
data "azurerm_key_vault_secret" "kv_secret_password" {
  name         = var.vmpassword
  key_vault_id = data.azurerm_key_vault.datakv.id
}
