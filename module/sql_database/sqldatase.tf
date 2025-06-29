
resource "azurerm_mssql_database" "sqldatabase" {
  name         = var.sql_database_name
  server_id    = data.azurerm_mssql_server.datasqlserver.id

}