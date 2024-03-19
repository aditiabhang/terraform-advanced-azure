# Resource - Linux Virtual Machine

resource "azurerm_linux_virtual_machine" "linux_vm" {
    name                = "linux-vm"
    resource_group_name = azurerm_resource_group.demo-resource-group-east-us.name
    location            = azurerm_resource_group.demo-resource-group-east-us.location
    size                = "Standard_B1s"
    admin_username      = "adminuser"
    admin_ssh_key {
        username   = "adminuser"
        public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    }
    network_interface_ids = [azurerm_network_interface.demo-network-interface.id]

    os_disk {
        name = "linux-vm-os-disk"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "RedHat"
        offer     = "RHEL"
        sku       = "8.6-gen2"
        version   = "latest"
    }

    custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}