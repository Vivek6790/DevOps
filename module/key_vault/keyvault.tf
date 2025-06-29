
# resource "azurerm_key_vault" "kv" {
#   name                        = var.key_vault_name
#   location                    = var.location
#   resource_group_name         = var.rg_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.vk.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"
#   enable_rbac_authorization = true
# }

# resource "azurerm_role_assignment" "roleasignment" {
#   scope                = azurerm_key_vault.kv.id
#   role_definition_name = "key vault administrator"
#   principal_id         = data.azurerm_client_config.vk.object_id
# }

# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "kv" {
#   name                = "B18-Locker"
#   resource_group_name = "RG-B18"
#   location            = "centralindia"
#   tenant_id           = "897f3f7c-3b99-4c2d-b177-c96fa44ada4c"
#   sku_name            = "standard"
# }

# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "kv" {
#   name                        = var.key_vault_name
#   location                    = var.location
#   resource_group_name         = var.rg_name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   soft_delete_retention_days = 90
#   enable_rbac_authorization   = true
# }

# output "key_vault_id" {
#   value = azurerm_key_vault.kv.id
# }

# output "key_vault_name" {
#   value = azurerm_key_vault.kv.name
# }



