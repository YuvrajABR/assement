output sql_server_name {
  value       = azurerm_mssql_server.sql_server.name
}

output sql_db_name {
  value       = azurerm_mssql_database.sql_database.name
}

output sql_username {
  value       = azurerm_mssql_server.sql_server.administrator_login
}