output "network_name" {
  value = azurerm_virtual_network.vnet1.name
  description = "Name of the Virtual network"
}

output "besubnet_id" {
  value = azurerm_subnet.be-subnet.id
  description = "Id of backend-subnet in the network"
}

output "fesubnet_id" {
  value = azurerm_subnet.fe-subnet.id
  description = "Id of frontend-subnet in the network"
}

output "dbsubnet_id" {
  value = azurerm_subnet.db-subnet.id
  description = "Id of dbsubnet in the network"
}
