output "resource_group_name" {
    value = azurerm_resource_group.3tier-azure-app.name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.3tier-azure-app.location
    description = "Location id of the resource group"
}
