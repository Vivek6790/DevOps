
data "azurerm_mssql_server" "datasqlserver" {
  name                = var.sql_server_name
  resource_group_name = var.rg_name
}

variable "sql_server_name" {}
variable "sql_database_name" {}
variable "rg_name" {}