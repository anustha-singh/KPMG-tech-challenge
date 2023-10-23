resource "azurerm_availability_set" "be_availabilty_set" {
  name                = "be_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_interface" "be-interface" {
    name = "be-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "backend-server"
        subnet_id = var.be_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "be-vm" {
  name = "be-vm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.be-interface.id ]
  availability_set_id = azurerm_availability_set.be_availabilty_set.id
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "be-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.be_host_name
    admin_username = var.be_username
    admin_password = var.be_os_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
  
  
  resource "azurerm_availability_set" "fe_availabilty_set" {
  name                = "fe_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
 }

resource "azurerm_network_interface" "fe-interface" {
    name = "fe-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "frontend-server"
        subnet_id = var.fe_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "fe-vm" {
  name = "fe-vm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.fe-interface.id ]
  availability_set_id = azurerm_availability_set.fe_availabilty_set.id
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "fe-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.fe_host_name
    admin_username = var.fe_username
    admin_password = var.fe_os_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
