provider "azurerm" {
  features {}
}

module "resource-group" {
  source         = "./resource-group"
  name           = var.name
  location       = var.location
}

module "network" {
  source         = "./network"
  location       = module.resource-group.location_id
  resource_group = module.resource-group.resource_group_name
  vnet_cidr       = var.vnet_cidr
  besubnet_cidr  = var.besubnet_cidr
  fesubnet_cidr  = var.fesubnet_cidr
  dbsubnet_cidr   = var.dbsubnet_cidr
}

module "security-group" {
  source         = "./security-group"
  location       = module.resource-group.location_id
  resource_group = module.resource-group.resource_group_name 
  be_subnet_id  = module.network.besubnet_id
  fe_subnet_id  = module.networking.fesubnet_id
  db_subnet_id   = module.networking.dbsubnet_id
}

module "servers" {
  source         = "./servers"
  location = module.resource-group.location_id
  resource_group = module.resourcegroup.resource_group_name
  be_subnet_id = module.networking.besubnet_id
  fe_subnet_id = module.networking.fesubnet_id
  be_host_name = var.be_host_name
  be_username = var.be_username
  be_os_password = var.be_os_password
  fe_host_name = var.fe_host_name
  fe_username = var.fe_username
  fe_os_password = var.fe_os_password
}

module "database" {
  source = "./database"
  location = module.resource-group.location_id
  resource_group = module.resource-group.resource_group_name
  database = var.database
  database_version = var.database_version
  database_admin_user = var.database_admin_user
  database_admin_password = var.database_admin_password
}
